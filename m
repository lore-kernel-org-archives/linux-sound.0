Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862553;
	b=wcuyUCOZC3egog4JZBeE97j644YIiJ009ZjjuAYLE813kloAL4QxzuBEHoENulVul3CA
	 tL4r59HeQ8zNxVRlRmDlPPR3nFlK1DwI6S5o48dCVzC2KQXi3ImJwI1OcIULdFQ02MXGl
	 FpJII+RsteBprU5UDjS6FANkx3cZ45KWz3lgVPdL9D5Xuc+d+8OkfUO2MsRMacDirg7/X
	 IILtvBONo2E360CEmEif15kx1Sixk9gOUx1siQt9tl0hZdjz0foBEX5ArLrhs/66jlAEr
	 +nnUO+4nptbqxBtgdGkiC9eo39dP7PBwBgSpNDB7rCKevbN/K9dOcHpXG97RHuE6f+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
	b=GHzTkwBNQLDFWiByKSD+EFjo7AADHIKbZFLU7VGVIDFpHLLsv7Byb0xOqYXiq06kCqb6
	 AJ9+U+4qKxlt9AILEnEfaA25uXF7c1d3Dfk8iZtIkPaq6MkzQeQAbTRg8WUZXFhL1Li5W
	 /vtFqJQljy37GFO32LCXE34rBw6ST6+RTYMHI0LSmn14BSrIDAgIXVEyzvHnJGCX/5x+5
	 KyJs1wzX0I0Qcq88DZ6Qe8LFjQ/9+W8oAuM1ikuEOoZfE/iviLvQ5TTfWAjDfpfHTcyBO
	 DBqhCynuAYgBnlVizcOOf/mTNUpgQqVVjkUw1W7aGCyEfAzaUQOnawFCyzoAdJ0kuGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB518606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB518606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso23187275e9.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 12:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862551; x=1795467351; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=VhXSKqN2KUJdD6k1M2C4NY2RWNQXwLUMa7za0KGRNTAszgCYrmzIrdkvn3YP2iZASp
         Okn2ZahhPIfImI6ASXd9oczijF5PYBuze1NR3SYEI/SPa8igSIUyONqgJjxRqh0fggnD
         OAGgxT6vOcKq4YkYpXZwpRxKF8KioS+AU93pG5/WJab+tK+M7cUEZgQkfGjDBvJjpbMF
         OmGYDullBl6FYriNxEKpo6GxS/Stf/V4L0w1v2A75LXSX9u4WLPkm6a4Bw/IlxWZT1a8
         HseiGkliKx4G1IRTjhBU0w+LnGW8MvAjCoxKhsfkfCtu3fNSWNq8USbBr/UfPKMVXuuQ
         A7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862551; x=1795467351;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=GsP83NuC9EZgQlD9gttEzNz7MV73WTdFVvACsI4wlN8NXfMsn1v78/EeZbII3TYi8B
         E7KEDFz/xo0OfY2FhptFkA4fDIgyhbwvXK1id5JLLS38qQez+2KHyHGpHIacYKINSfPO
         QONrqTtTN37ikgScVzcTSTUa3RpS0yO7vKxhxiuJU8SzPzJJtVDeSq5yqPhkhYjLzQNu
         JeIgqZEQAS0E0B6sO+ZQkgTxiGHFMWZ+lZSmIgBxMPr2X2f8HXTbKld3g4T07g4vFqCP
         ketjp5XBGLq/TY2psAD34qRY1dWGaNc2eZm5FfXqSimKPfXuvPfmYHCZLrt4zrb9mvbA
         mxVg==
X-Forwarded-Encrypted: i=1; AL+hErGKpn+5DTTAEsZTgEgNEDny+PANcgoFxqcnmcMjJcVvOaifgdV1nkya/o17+ZF9rFbPuH7UBN1HT5RM4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aRlhdJ2I3dHLrE8a6T42qgkPSWbz2vIqrYQ+EpfjtwZE2ishB
	vC/CMpXKzUOJIQ4xh2g1KFQOWVDt7JL/1y/kS2BqetBF2luyW6trqTaA
X-Gm-Gg: AYBFou0tL7eDsnlMU+tV6kRI5TOsB2QmKVvLPagyf6Q3w4Y8/iC71vNjwxPSPqNFOll
	Obp/fXcM40ezb/lWjdr0xO4//qIn53JsShq+UibNzLcDmyODfd6eerJ84rjptzwZjmnUX6jJFL1
	ro1brIf6bKseW3rQr85GX1qd1ilVbhvlesn/g5SzwjsAteBIuiuEzcmj4tefdYoC8RSoKaixajp
	bHkdgeKjZRq1ObLUgLybQd4YoTQp7NNnQfeyuJEBAyUNS/RExMopBRpMGIky/McTcaCkKfq7WQ9
	RMh3mNDTnaglSsVPotLpvloaKu5X1HOME6wnOz1UVewDf9g9epLnoFzJNTlEPImHae+FKyMsapl
	XVf9FjjNz55lo1Cb5hCYg8gzaMbPZ1qJl/ahwxT5xegIVnpb1jzBxpuw5B4lBnzwUMrpTcO3XS4
	XLaDCplu8G79o/iELixwi1HaggDh9dmWkUc5uPOEdxGH8gZknDLowkrTGaicpLzFy+Ql49CiOnS
	EoT+Ckdl1VpImHovGtCkx7JlqhSmJsTqcRAeKAeDp7TAWNN8BzdiNIq
X-Received: by 2002:a05:600c:1d0e:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb55aa28e9mr258682125e9.32.1794862551105;
        Mon, 16 Nov 2026 12:55:51 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:50 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:50 -0800 (PST)
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
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <c15d3417cda640aebc7bebff76b0448e@gmail.com>
In-Reply-To: <6fc5be59b56e42728e33595d5415441f@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
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
KQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVy
IDx5YXNzMjcxMDZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3Jpbml2YXMua2FuZGFnYXRsYUBvc3MucXVhbGNvbW0uY29tPgotLS0KIGRyaXZlcnMvc291bmR3
aXJlL3Fjb20uYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9x
Y29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggYzMxZDkyMWY2NzkuLjJjZjJh
OGEyYmM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysrIGIvZHJpdmVy
cy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3RhdGljIGlycXJldHVybl90
IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJdTMyIGk7CiAJ
aW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKSkKKwkJ
cmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3RybC0+cmVnX2xheW91
dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRyX3N0cyk7CkBAIC0x
Njc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQljbGtfcHJlcGFyZV9l
bmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGsp
OworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5hYmxlIGlmYWNlIGNs
b2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYgPSBkZXY7CiAJZGV2
X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3ICsxODA2LDkgQEAgc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBzd3JtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAkJCWRpc2FibGVfaXJxX25vc3luYyhjdHJsLT53YWtlX2lycSk7CiAJfQogCi0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJaWYgKGN0cmwtPmNsb2Nr
X3N0b3Bfbm90X3N1cHBvcnRlZCkgewogCQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVy
YXRpb24pOwotLSAKMi41NS4wCg==
