import jwt, { SignOptions, Secret } from "jsonwebtoken";

const secret: Secret = process.env.JWT_SECRET as Secret;

export const signToken = (payload: object, expiresIn: SignOptions["expiresIn"] = "15m") => {
  const options: SignOptions = { expiresIn };
  return jwt.sign(payload, secret, options);
};

export const verifyToken = <T = any>(token: string) => jwt.verify(token, secret) as T;
