Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645036;
	b=DFCOXhj/zfZ/qORi6z7UrOXWdU+qK/bRavKMrcuUzkTH3OqRLh6TdPthWxQxtHoF52ei
	 CtFQm0g1drDCOIOt9j6kDovoKZYHMjl9ZaGyw46ZKGAm1fVl0/aNBxdCWa/9bSqOrvybD
	 TjMGWKvCnuaAxnLtWKLwRM9ybS4TswUfp/1JTLHq7YrGYGFamIiesSc3ryy93HTwkrOP8
	 gCc18/2ZaQv8jkOQ6cvNcP/3snFFgJzqoeOgKnlZ1Uzk9BdBMGC8UwmGAGVVUPAVUkm9v
	 245SndBWnHkTyBEqw6AUgisrdcZoZsLo7RbULqoB7sZ2dth+zpij++maX9PdGrP7HrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
	b=SAUHKzykAP8G7DxmMsP3WazWBDSC3dH0dG8b2jELLsSQTIM1snppxu1RWWjxOqt5XXPL
	 pQXqgX7FjtE+1KkOGpQauzsfEWLRRfSsM5QGCRN1l9hhDaeWeYo/dBcP05pZhDazhRlPV
	 +qL+eHV1Ks4lXvEYN7XodDqY/wXk7u8RbD/n3SOCcdUHMaO2+4VWS+tqQpOBJBQvbItmL
	 7ymTpdjUgJ394w4Rvh4gNh+RQh6LZJwqfMVIqSSZb7AAp1UlRUwMOHjS3LkdgVNGzYqzD
	 iSuu0IDQIukOu1fk6zL39SpCJ4wsX+JADsU7LHX9Fy7HHsQXHcsDc191ZlN2ej3usHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tocbLiPW;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0BE606A336
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0BE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tocbLiPW
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49a92144733so676231f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645034; x=1795249834; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
        b=tocbLiPWz7ToPwlLUt4j3nC0wlhd5a0f/WMe6qNDoYiksejbN6KiVYB3r/nQ3y7vRi
         +P/YyAfi5aEPGSnuaul5LfAtsvSrVNtkSdCVZC7247HwGw/8FusEKtY9sHJGft/jHWL/
         b9PiN/M+pAFCnPtT8zrCdBW8W787JTVvC9gkCM/CnjqLqvJ8KG9Mrazz8GzD/qsm/3Et
         0tLVHQQR+oFgnxqcXFlr36bIRjK5kxhY8CaOsrygmT20GncZPAUocwSKnrMNHo1+EKOA
         xzHtSwaF9zeWsBktj0/bsdKGln21AzboydY0vo85JG5akHgme7Tffts74cHnbwtBEys0
         Qv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645034; x=1795249834;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
        b=TXu+qg+UAh/IFV7FyEDLtmhAIHswcUq4ZtmZW8k0cn0Nz098YdofmVx2lVr8pMKHbn
         i0P8l34rh3K9TjKn6Vcuy+0McYY2i9qPsnfbJibN48Uvq1MSIUa5veP9SBO93abR4+jv
         Io00GJu+b1YudFssSjGMashofaV23OCHw8sg+gS+E/f5t6PnVcWnedoc4tCRaS/i3REy
         4YTZgrf9FP3kFPdFwykarT947iBLnMqJa8q6PcErb9RdbBTL933u2rDUqthhOhEXfuWn
         /1hO21tt8hsI/GAQVvEf7C6NWcOau87e/Q2GWNxrnsDKyYgVDRncsUCHaAnFnXtMlhyb
         iwzQ==
X-Forwarded-Encrypted: i=1; AL+hErEis/ZYqnM9C2Oy+jA6TXrKXQuMNEKI6y5ozmz1fmvZ2LoK3SsZhCjGmxkVogThGpqmsZp0qcEAU8e12A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SuIurF5rujAfcY5UrIO4f8nVrL2So0usiRus+HCCMBldgl/3s
	ukCwmn/fKsynlTG9X8H3JNgCpP7eklXatTzfd6gG/auvc3yXo698mkcd
X-Gm-Gg: AYBFou1i9HGd8Rrtk+5S74b1N/+DeX5+/ypPG7ufrcYEL+vGFcsOXUm8Yu5OAI11Rn9
	3wRJ/WrC+9Gp8Op+kYKEW9OIRWlNoRmzc8H8ZKgjSbfQB+FqOfq0lxKcx+UQUQuoYWQdTRW/99/
	cLXMnUcbHXkP3PK6shqB5vW6Kk6Sr2hpMXBgEJLsFrN0A4Y9C9hIhveKAaO5iCNERGcAPOT6Ooc
	to/Fs7JkZZBMi8dDsXtMmHp4/kPJPQgyAEw7/BbbaVj5I5Tc17NOQfsWIUBEsLBbO/mgb9lOENl
	tWB69An7/6WC6GSWvLa5tbLu/t+r69WFdyBX1nkMEhsCIHk595knIQKSg6lqOMJqXMnZJZatZ0R
	1UoQFHbnjkAPEGQrjG8oEC0qvg1OkaeV0kucwmEiJY6M+omalPF+htCh/gwI2DM4lUXHnDhbcLG
	lu+QStFOcQXzCqGQ3DExE6e3hZtLfHYWwjOqcu+7cpKTY6TsMnbXxPsrFpp803K+U6O8Q4VHJyW
	zI8kCgpHiAIoCRo0H06U47OTTNaWsS0g4I+/68w0yPJxl00vfQJ
X-Received: by 2002:a05:6000:25f1:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-49c7381a73amr9429791f8f.55.1794645034503;
        Sat, 14 Nov 2026 00:30:34 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:33 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
In-Reply-To: <6ffb6f7ab9794a49a50771d23b3a1e1f@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciAocmV0dXJuaW5nIElSUV9OT05FLAphcyB0aGUgaW50ZXJydXB0IHN0YXR1cyBp
cyBub3QgcmVhZCBvciBjbGVhcmVkIG9uIHRoYXQgcGF0aCksIGluCnByb2JlLCBhbmQgaW4gdGhl
IHJ1bnRpbWUgcmVzdW1lIHBhdGggKHJldHVybmluZyB0aGUgZXJyb3Igd2l0aG91dAp1bm1hc2tp
bmcgdGhlIGxldmVsLWhpZ2ggd2FrZSBJUlEsIHdoaWNoIHdvdWxkIHN0b3JtIHdoaWxlIHRoZSBz
bGF2ZQprZWVwcyBkcml2aW5nIHRoZSBsaW5lKS4KCkZpeGVzOiAwMmVmYjQ5YWE4MDUgKCJzb3Vu
ZHdpcmU6IHFjb206IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgY29udHJvbGxlciIpCkZpeGVz
OiA3NGU3OWRhOWZkNDYgKCJzb3VuZHdpcmU6IHFjb206IGFkZCBydW50aW1lIHBtIHN1cHBvcnQi
KQpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvc291bmR3aXJlL3Fjb20uYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvdW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggNmUw
YzVmYjEwZWYuLjYyYTQ0ZjY0ZGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29t
LmMKKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3Rh
dGljIGlycXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZf
aWQpCiAJdTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKSkKKwkJcmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwg
Y3RybC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZp
bnRyX3N0cyk7CkBAIC0xNjc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAK
LQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5h
YmxlKGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8g
ZW5hYmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5k
ZXYgPSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3
ICsxODA2LDkgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzd3JtX3J1bnRpbWVfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCWRpc2FibGVfaXJxX25vc3luYyhjdHJsLT53YWtlX2ly
cSk7CiAJfQogCi0JY2xrX3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCXJldCA9IGNsa19w
cmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJ
aWYgKGN0cmwtPmNsb2NrX3N0b3Bfbm90X3N1cHBvcnRlZCkgewogCQlyZWluaXRfY29tcGxldGlv
bigmY3RybC0+ZW51bWVyYXRpb24pOwotLSAKMi41NS4wCg==
