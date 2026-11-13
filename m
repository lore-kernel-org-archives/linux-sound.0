Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603762;
	b=MWxB4dUMMUxlYwOtZl2om7me4dZaaK76CVgQaHG22pdEVNxLM+rySsBaa2qdlHHFi4Fo
	 XgtTF9HiHW90HUw0PmqWnyexAonRxwIMwZ0MXU66e9sZ4qbm7J4uSNDt7dwOEQ4Ad+HKE
	 k8qOOZnKeQsg0h0jxMuAf6UlJi4Ne19t7EMro3DdBjiQ/kUO4ZPX0H2BWIl96H3sb26MF
	 6A9mikMJzCwC3axOf9sbasFLNkKFHgPU929lbjhldFuda/VyTVzOa44mI6oz9NrpqSRje
	 ouW4lteSevwoQipOJnZHfcVWudZHTMBPHZWHxB4yEAIdlxUuGLbuPdLY4wnI9PLxJmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
	b=Gr2pScO/B7mcHJGSOLdVwGhtjflQTWOkcwHPjrTmU7AUNyaBWn3xGxXEiRTLZOovfxEi
	 Ztejipiym//a9gCxopVGb83VM7MKPbCOSKCcOWSIngM0VaqxnOqrb7FT5xdUgGX22jnJT
	 /ub1ItxGwXW0JAr1ymPg4NpsyP6G20qeliSJXWiqDXIEM7RdAhMP7PCQLZNMSvBvKbBi/
	 jeqRUdYWF5rIpXvcjC/QasvN8wa/bLUDLLU8TAZo+gldjmcZdU3lJfXAX7oDXaQjO3sTc
	 jydsXPAaKjpz6ytN5r80PLjxl2DmRRKlAnbpDjgS9uhMf0AxA0cd+Fswek09VXTjhOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD26B606A883
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD26B606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b80834ce1aso2254425e9.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603760; x=1795208560; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=vhNWPkFDUTrf2CnKOWMgYdIWu2o0nTf/e4Pu1EMpPy+H20XWePJ5nudOwmGMKSlrpi
         xwuhBQVNPouq9VItlLs2XhVtJ7CE4XkjjcJ4GtkBi4O1eFX3JiW0DW1+HoQnoRIRLJiW
         dMlm7pVZR55ZO8iQmlKB50fDcuqZfHokMfUUZzY0TlI+h0gNLO1gLJV0goXZVzg3VtUN
         UYj1RXXhaxzNt5yibTMUm5pQ9xeI3uqvh09oQx7nEatKSJmSjwrEP7xhN/y3EVRWZCOj
         xiEW+tGGXSmWEtpk6kE0awccANgaaAs8Nfqf/Bz2U/Cv509PgCVebIBieyT/KMD53iYA
         GEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603760; x=1795208560;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=zVJcEe76a7GJ5/OZkbu/fF1qfnz4Y0FIRK5ZA0pFBqjgTFay5mcERMGKkrF4ixWh1G
         I6fBSfeEjDv9kXvFJ8GaEKqUH841dsyWYDdO3kXuw4BYcsjk1kvwe/XiNr9qT/pbW4IO
         68UrrjXGvPHOt3VcDfSWfP3UCBDvn/e10GVIKl0mBgX/YMvo1WlgpJKLY9x4fl3/o6Hu
         IrKYuyEb7h/fo4T1NNZlO+spr0duOgUPmgwE+8T/7SYvrtGLEmTh4QwBk2v0NrNLt1U/
         t7S6tP0wGgTYsMun5XuHnbNg7S0EGGF5wvfmqrn67jLlxBbAZql9rVTwtgWGCHFrQ+oV
         wE4g==
X-Forwarded-Encrypted: i=1; AL+hErHRguyNgWOo8GZWKPYAgQNKxi8icjxzHLouSr1vpCbDxVZUNydwEEfdjwinIpyANxbR4Xkw1WbN7G/aWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z96JckI7z0/sZGEQIoSEEAF1neFlrRqMG/9iBwrN5KhyZL5nvdn
	KA6ceJ5d52SCx3oHRxYyo79dF9qld2KmNBgDTRPUPKIAD+8px4fEQ/PQ
X-Gm-Gg: AYBFou3fNaRsQopA1FuYt7WRfa6ugtzS8s3RYUVCjVB9oe4af7l64zDfRTGP0LAO0R9
	hXPbRry3QTLB0yikviaP3QId0Ynx3ppBgOmq7OopL+CT368e39elS8Ub/VYTjFNyhsnMqmPrPNZ
	huq6vS5r5zkMuRmbG9smfmEmJoR2xQNoRGbI3xDDtiavEgLl0DSo+/fDLx/fFVOBNIlZJz1Xk+r
	thoBQx97k6Y0ArjUYqtIMnB0R0KbV4Rw0bVNr6SkCRI//421hc5MAVpeeWf7DTmse43O0DJBYIZ
	9IeNu4kTQJQ20Y2eR4R+uf97epQF5Njtrn7SMvCFDG5vxzphcsyR+7/uzd6DBhRBK+E29VuPNIM
	ZAF5KimiBtBxDWrGmL2anx1nqYsB3xPOh4F0ME8753XeBuYPr9c+FdBZURyVnTMlCGvX/9ktEeP
	kjocCD/4wmBBd95FaTePB/ezEVF+2BCwKb8BjfMrOHXY9xoxUKiP60evqchHNM+bHU8qBuMRDf2
	JeNwOi/ajNvEWM+55YH5xr5WLvXL4Xqlbl3CAuLq8ABovqEN5ppWelgrFZfAoFDqSo3GJ3IeA==
X-Received: by 2002:a05:600c:a318:b0:4bb:5f4a:db62 with SMTP id 5b1f17b1804b1-4bb5f4adc6dmr22065715e9.14.1794603760103;
        Fri, 13 Nov 2026 13:02:40 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:39 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:39 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <1ce6d7664e48413d9a5a8b11a986f746@gmail.com>
In-Reply-To: <0a29235e23b24698adc59fd117e0a222@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKHB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==
