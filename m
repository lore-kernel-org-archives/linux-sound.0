Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857458;
	b=4QoPGl0asOrJlekCLeJVyU1fStYBYIFzlKuQrG4znmZhbw9H+cmDr6HtbYsYKiVwUKy0
	 GuoQEylsy+XVdLjJoL6tNMBwOWHihPo2RGT9/xmMPINg5Xt/nYyh5M+9Ds937ADPMQXK5
	 mgvzs4eiYv3CtO0oXeRsS3jwGKfN2wHNHxWmO6HH52mOOn2nLTPukUzAl7LXSADVuXa1e
	 P3HZjCxqatr4quIhNtJ41ozj4jryX6bcookGeONymOdGfbyxsaWg5i1imzE023TEQxmaA
	 vguLtfU6MlkjDaZQk22neOdu+jKDSGIPM0lWBsg8uk1EYRV9qG9U3NxBU3l47hIJESA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
	b=IJ56qKXPy2wxosDWlx6wPBpkwhnMrCpowJ7aEoz2tVEP594WnbVwK8mDrS9fODIJ5E0u
	 Z4deReOqlkU+wyj3WoMfDXHgcC3LnQdqwjJCkSwPFY92S9cCzcXrp+GJRCFRjuAGTHGq+
	 SpBhsdfdUZlVvXmQnUMrubO4ASFVqSTH7XHzTSqz2b3kTiscXjALDGNcE+O/MHFVt9Up8
	 +8Y2YjJkz3FxKcgkRyg9YlIcPs+sifgTdx5OQ6+fNZM2azVsOD0yo1/RdhP+IAKi7vRlG
	 LzB21TREycmH7qp9uYHfVDG4PgiKLkzl4wx+5ABmSYwr+xz211NtSIfkF8FsbXrG27Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEy1AElb;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B1E606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 19:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEy1AElb
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso15273555e9.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857456; x=1795462256; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
        b=uEy1AElbgSN0iCbkHQHkrKmNsM5r3ifbSQ7MflZws670z1/j3XYQdOz48yxOPyaL4s
         OnMA9u0AM8XheCSCp8GjPpfa5hoNvGLyi7CE+UX9NUMjl6r6ZC5HI+l3oD47WctQ3f1P
         HU/MyiF8UH1zBhaoAkpuLOEPKzEnNw5Tty4ZE7srT+EqGmxJAvHbXGoF7UQ5Qs1ZDP0n
         2MZzc9shFf8oMnwKbQXiwfMTswA7/x+mAcIxIg7bugBCUJkoMA2SWLcfaoKaSg/vuDTu
         nx7esPZ9gdHvzYV0id1z6Ih+czIMOqDs+cNZLXPdITpR4tEbhO10xHpHvCBiQPRAycBM
         PMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857456; x=1795462256;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
        b=P11L4YJMxJdppGCFbU6DxA7ek+TANQRVF9OEanNB/Zg1QBceeULgLs68iMQX6ph5sW
         KKBWRJXd4Ss55lVAatIWoT2gLF7OZoAtG0HAkCu3J1IMycyCMmGyjHarKcLse15GMiIA
         bX1hXaxLTDORQrfkGpnyNkNJAZ/gt0WGImgm9Xb8PKqKrIvbou3Y9afr73mAfTvrSLKe
         Ps16JA7E9CWjR1j+l/ASwp9vezuoWoFNBKqL5luEU50KBkh4yjmkD9xUEhAuBOsSKPXH
         NI9SxinhNXreVWvtECtROOCWX7oMePlGXOr0w8ahnZleUIZStXF3c7D+c/ImWNZj3jfG
         pbUg==
X-Forwarded-Encrypted: i=1; AL+hErFWOdLqfQQvc0XSOZfMveu6FzG8ZymMDQD3Icse198cLKeASJ2S3a6695r8BjLn3t+wLvKr+d7igunenQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ro2UcOyG9qofKJT8pgUM4487KWeNJF8kH1odLwwmh0A198xlv
	HixPWz5QvPdRP80J6PitzQdOdZrlIdp+qtmXuis7EVXpXli1xCwY61gO
X-Gm-Gg: AYBFou0vbRsuwxxffpincleU2T9sYVcM6m8M9ma0w9zc+xb8QtBKkcNUdGtnDdnNgzo
	taIXtQuaOF74ivbszlDkeW0xdZkHWk4DDO7VvXxEpBlwB+W1nemQ/Z4GQED6kL8s72/JuzXY4Lb
	3rttSOpFFNPtyeBFv8FioyX7AQtpVh79P1uzzKFKtPYEM83iR+rL0kLCyRtyOh7FKqFp9PaRP/L
	1+nAtNqhkm5TVOiFdvZpGLqLZonEU8vhRwdoLj0pHxwki48IlF0mTva7sYQXckNBmyVTrPtCB3J
	mtkk2SXliCq0wPPSqtM6fjWUV80ZxvABGDegxdkYGls28/51aGCTzfL9Hg2tGq8g7WWENAxsmvq
	iXIHPBSlSyvtPzFx4OGObrRgy6hdZEgv5HD+jZL7h/wCl0LMpdcpkyLfTSUscYtBOI18G5y6ZbK
	B6N6tPfFRQusFJx6u4kU/adopdElRwdROucDDhXcyayHidKuqcs1kVLeKDbD6xwFx8bWk6YHJx4
	9XpEX78HrLSkD9ZJrSq0T2pRYmyD1rFtFEXaVDLV5GPEAw+73MfynME
X-Received: by 2002:a05:600c:428c:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb55aabd53mr158518805e9.29.1794857456017;
        Mon, 16 Nov 2026 11:30:56 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm16318555e9.1.2026.11.16.11.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:55 -0800 (PST)
Date: Mon, 16 Nov 2026 11:30:55 -0800 (PST)
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
To: srinivas.kandagatla@oss.qualcomm.com
Cc: broonie@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v3 3/4] ASoC: qcom: lpass macro / soundwire: asynchronous
 probe with clock retry
In-Reply-To: <efa3cc40-15ff-44e2-b783-333306bc4ee4@oss.qualcomm.com>
References: <efa3cc40-15ff-44e2-b783-333306bc4ee4@oss.qualcomm.com>
Message-ID: <312911d6ca094b94b90264688aeb9df7@gmail.com>

SGkgU3JpbmksCgpUaGFua3MgZm9yIHRoZSByZXZpZXcsIGFuZCBmb3IgdGhlIFJldmlld2VkLWJ5
IG9uIHRoZQpjbGtfcHJlcGFyZV9lbmFibGUoKSBmaXggKENjOiBzdGFibGUgd2lsbCBiZSBhZGRl
ZCBpbiB0aGUgcmVwb3N0KS4KClRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uIGFib3V0IHRoZSByZXRy
eSBwYXRjaDogb24gdGhlIEFzdXMgVml2b2Jvb2sgMTYKWDE2MDdRQSAoWDFQNDIxMDApLCB0aGUg
Ym9vdCBzaG93ZWQgdGhlIExQQVNTIG1hY3JvIGFuZCBTb3VuZFdpcmUKZGV2aWNlcyBuZXZlciBj
b21pbmcgdXAsIHdpdGggdmFfbWFjcm8gbG9nZ2luZyAicWNvbSxkbWljLXNhbXBsZS1yYXRlCmR0
IGVudHJ5IG1pc3NpbmciIGFuZCB0aGUgYXVkaW8gREFJcyBzdGF5aW5nIGRlZmVycmVkLiBNeSBk
aWFnbm9zaXMgYXQKdGhlIHRpbWUgd2FzIHRoYXQgdGhlaXIgY2xvY2sgcHJvdmlkZXJzIHJlZ2lz
dGVyZWQgbGF0ZSBhbmQgbmV2ZXIKdHJpZ2dlcmVkIGEgZGVmZXJyZWQtcHJvYmUgcmV0cnksIGhl
bmNlIHRoZSByZXRyeSBhdHRlbXB0LiBUaGF0IHBhdGNoCmlzIG5vdyBkcm9wcGVkOiBmb2xsb3dp
bmcgdGhlIHJldmlldyBpdCBiZWNhbWUgY2xlYXIgdGhlIGRyaXZlciBjb3JlCmRvZXMgcmV0cmln
Z2VyIGRlZmVycmVkLXByb2JlIHJ1bnMgd2hlbiBzdXBwbGllcnMgcmVnaXN0ZXIsIHNvIHRoZQpo
YWNrIHdhcyBhaW1lZCBhdCB0aGUgd3JvbmcgdGhpbmcuIFRoZSBhY3R1YWwgZml4ZXMgd2VyZSBp
biB0aGUgZGV2aWNlCnRyZWUgLSB0aGUgbWlzc2luZyBxY29tLGRtaWMtc2FtcGxlLXJhdGUgYW5k
IHZkZC1taWNiLXN1cHBseQpwcm9wZXJ0aWVzIG9uIHRoZSBWQSBtYWNybywgcGx1cyB0aGUgdW5w
b3B1bGF0ZWQgcG1jODM4MF82IGNsdXN0ZXIKUE1JQyAtIHdoaWNoIHdlbnQgaW50byB0aGUgY3Vy
cmVudCBzZXJpZXMgKHBhdGNoIDIvMykuCgpCZXN0IHJlZ2FyZHMsCkRhbmllbCBDYXJ0ZXIK
