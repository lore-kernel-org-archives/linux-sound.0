Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645014;
	b=bqz8X58uj1XUfuXex+TE7qafCVAjluHLMl9VGyv/6ddAeXCZDF9IjeaaqEhYSOeEx9ut
	 lnQQFmlbV7xDL9l1hManHAQho+Nh4mJ0Q/E3dDITtBnnlfEloPAdF32yFbB3IX2Mn3Rfo
	 WKet79OLz9WxsdzkNIBMCa1tA8d4ivuW+gGd9LU5yrj06TLda/W+uz8VyCMnVtWticvJ+
	 MI0rpNi9iGgkHlxCr5qxkWdUP/zCgwEYe/ESGB0Q5AiR4plE/qWKWrRocj3lcAvB5QXE9
	 04ZTYdiJEfdddnz7TWJ+ZGWZNBzpj5qiVVO64gWSPIeczX5PaU0iq8WMdgo126Vking==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
	b=dcLwLHwvz4aVnFNClJxsH+CVqyrJ3ABzsTthm/wKhI1F0RG68n+V/AybV7eTgdWNUpMS
	 wOExNvqgEyXYSoH9pa+GVMK94Ce9IWT0yLTUzO8Bc8nj9NPCj+q7tIjysh6KZAsXtI7qC
	 mGf06vq6e4yXJYkatQnzuk4FyHIref15SPLskV+S3BEGYO1iTVji7xJ91z2q/mcOCfyer
	 8g3RgsSbn/4FTUYX6STHivEmswUkzgevzfthk4SguRQTQowPuy5ImeRoZgzvQGqXgXROI
	 0T2DEL1E37EUlhfPTrvoLQgJRFrpEIbR2HjWzehkP7QJc8wNZLTqTGjEkWumhsypAGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99275606A33F
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 08:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99275606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922dbcee23so780737f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 00:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645013; x=1795249813; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=l1cNDI6maJQghXoN5Bi3lRgzuojcOPv/fbKoo6wB7B4ANNCwdsmC1uDJGvRWeh+8Or
         RczhXvtEz7U2aEfXDHYHHb100veeL5CTuQgmKX1Ahgpy7/Iy+myvw5N8OG46JM7KQZq/
         6yOBt95prApmoYTfLzMf0TpHbSdwEXR1SSUnEvVJBEUHvkhiezddLe0hYD48Q4w7a+a2
         QlLp35R69SBgrBQd/m7x+VYQdUd3iEwhsiSN/8nMNuxExrvVmAJLutWH8lzjW16BN1YT
         brJ3a0A2uD2PK5qVBbtyqFMYT0yheWw30f2Q9bto0taHAZoJ2qihB1W2jC+IeF9Kd15X
         MtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645013; x=1795249813;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=EX1/JfPnVN89zquGzR4VYVZG2vDg23aLEZBnhtB/rLg5B38M9WP+xnvRSjM1ADQn7x
         ke4FvFruXtsqYA7/MsOa4IeECr4ZqW16bbgOrcLRZlug6MUC/75N7Smi1IsOspiYnzRA
         j78sDO1Cjs4n4sroDjg9OyqHRaESFUAL4309e7LnPkLxJH8MWKnC2ENZPEKnn+/TWPMr
         v2dpEgtHsULPZwOM2wWv61k4fqKyRhT3mMOEXkugqHAOjR0CU8oqH9C8uu4UzXKRXolg
         oXYHgjELSC9o1SWXBDU70hKolII4nMtvgncyAjVtlVahbdY7VxO+rsBgbphxub6pvTSA
         shqA==
X-Forwarded-Encrypted: i=1; AL+hErFq2bpqMpaCJ59ctM5onucCVnbeJ6fzqGITlL4Rs/a67kPjybJbkK/2FSqRvF7vps2d4fAQ2JKXYGLv/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MCpgweR3nx8BrGzoAvD7VZPUi+U9mx5RbOjEH5HRk9l8FPHAN
	X6r5YvxJJt6MHhg1NOV2NQFZu6urfnS0ltEXI5aq9wjcOzuQkJSK4v76
X-Gm-Gg: AYBFou0OF1mjI8ekq7sYqkw0FVLMG+LvWPGlsAlCZbnKG9k7ZmO/FQoc50Yz3u4PRoR
	3UKu+/OFdY90Uxe4O2CEoOzlRm5akt3iZyqLPRP6/jbWv8wGGl9h9AAB+9LOQBkqcEeIhFN6r5a
	KVXbUnWsBNltpkFp+MXtRPxRLIXfvpVdqtVU3MbLesyyAemHiVX/yB91+gkjAx2pCdReYZvgdeB
	vgQknismISbxGhcqiSrMWNSKnORll2S3+bM7wA1XkT7+rti1w9RESKE0se5eTOBdMhOfjaXKfZI
	ADUN4DMMSLfLBX2Xfjb2W+gXdJvRbTL/FUi6G7HOa6gK6tdjwJEIS/qagia4uln98WLKI4SgwXb
	c+4KCdQjQvKHy064y8k+OFy4vvAfGN8gIeb+JxzaTNi5g7LraebBFLyjqki01jF1VCTlEU1qRAx
	a0UlNDWHqXoaImPS4k88mLieibnSyGMNkgopbXQATc17w1Klr7B6vjkmqtMFs9Z1bVf4nf1LFuQ
	JqT4xDNzcl7RkrQhpDfhEMGWVSlwkAkufsePqi5IqMwTDvn53Wz
X-Received: by 2002:a5d:64c3:0:b0:490:1358:2265 with SMTP id ffacd0b85a97d-49c72ab09fdmr11144513f8f.34.1794645012869;
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:12 -0800 (PST)
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
Subject: [PATCH v4 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2NCBvZiB0aGUgc2VyaWVzLCBub3cgc2VudCBhcyBhIGZy
ZXNoIHRocmVhZCAodjMgd2FzIHNlbnQgYXMgcmVwbGllcwppbnNpZGUgdGhlIHYyIHRocmVhZCwg
d2hpY2ggbWFkZSBpdCBlYXN5IHRvIG1pc3MgLSBhcG9sb2dpZXMgZm9yIHRoYXQsCmFuZCBmb3Ig
djIgcmVhY2hpbmcgeW91IHdpdGggdGhlIGNvbW1pdCBkZXNjcmlwdGlvbnMgc3RyaXBwZWQgYnkg
bXkKbWFpbCBzZXR1cDsgdGhlIGNvbW1pdHMgdGhlbXNlbHZlcyB3ZXJlIGFsd2F5cyBjb21wbGV0
ZSkuCgpDaGFuZ2VzIHNpbmNlIHYzOgoKLSBEcm9wcGVkIHRoZSBMUEFTUyBtYWNybyAvIFNvdW5k
V2lyZSBjbG9jay1yZXRyeSBwYXRjaCBmb2xsb3dpbmcKICBNYXJrIEJyb3duJ3MgcmV2aWV3LiBU
aGUgZHJpdmVyIGNvcmUgYWxyZWFkeSByZXRyaWdnZXJzIGRlZmVycmVkCiAgcHJvYmUgd2hlbiBz
dXBwbGllcnMgcmVnaXN0ZXIsIGFuZCBhIGJvdW5kZWQgcmV0cnkgbG9vcCBvcGVuLWNvZGVkCiAg
aW4gZml2ZSBkcml2ZXJzIGlzIG5vdCB0aGUgcmlnaHQgZml4LgotIHNvdW5kd2lyZTogdGhlIGNs
a19wcmVwYXJlX2VuYWJsZSgpIGNoZWNrIG5vdyByZXR1cm5zIElSUV9OT05FIGZyb20KICB0aGUg
aW50ZXJydXB0IGhhbmRsZXIgKHRoZSBzdGF0dXMgaXMgbmVpdGhlciByZWFkIG5vciBjbGVhcmVk
IG9uCiAgdGhhdCBwYXRoKSwgY2FycmllcyBGaXhlczogdGFncywgYW5kIHRoZSBydW50aW1lIHJl
c3VtZSBlcnJvciBwYXRoCiAgcmV0dXJucyB0aGUgZXJyb3Igd2l0aG91dCB1bm1hc2tpbmcgdGhl
IGxldmVsLWhpZ2ggd2FrZSBJUlEuCi0gYXJtNjQvZHRzOiBzdHlsZSBjbGVhbnVwcyAtIHN0YXR1
cyBwcm9wZXJ0aWVzIHBsYWNlZCBsYXN0LAogIGFscGhhYmV0aWNhbCBvcmRlcmluZyBvZiBEQUkt
bGluayBzdWJub2RlcywgY29udGludWF0aW9uIGxpbmVzCiAgYWxpZ25lZCB0byA4LWNvbHVtbiB0
YWJzLCBjaGFzc2lzLXR5cGUgbm8gbG9uZ2VyIGR1cGxpY2F0ZWQgZnJvbQogIHRoZSBzaGFyZWQg
ZHRzaS4KLSBUaGUgYmluZGluZ3MgcGF0Y2ggbm93IHVzZXMgdGhlICJkdC1iaW5kaW5nczogYXJt
OiBxY29tOiIgc3ViamVjdAogIHByZWZpeC4KClNlcmllczoKWzEvM10gZHQtYmluZGluZ3M6IGFy
bTogcWNvbTogZG9jdW1lbnQgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsyLzNdIGFybTY0OiBk
dHM6IHFjb206IGFkZCBkZXZpY2UgdHJlZSBmb3IgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsz
LzNdIHNvdW5kd2lyZTogcWNvbTogY2hlY2sgY2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZh
bHVlcwoKQmVzdCByZWdhcmRzLApEYW5pZWwgQ2FydGVyCg==
