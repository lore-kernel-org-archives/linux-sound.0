Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862531;
	b=QAdhTXbFPbCB+7yOIX6RrVl9pKmgWQjZvFTaAzWQctQxXZlA9zHUBz9RC70JZG2L1TCw
	 nz7VhGANr5WqShqPXgNUmuQZMHn0mR6SswecwCanm6mKYh3bW7SX9ImceamGfM258Mxk1
	 3HvLwBtGcVMjOw2lRxWY7hUGeEgMkQBaKGPEKrnr3Uldd6lTRFZEHck1k9g928MQDFH2k
	 +ji2NSKyaQt/ZVyHscLeYfraB0AiCn2tI8aJUZWivhVmmxan872BoiagANd16nbPbdGme
	 zQ+sLx526hFSJvJvpWqtCmdabRA6jneMCmjuigJhC84BiQHkpV7RESO8ah37PtmUiAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
	b=Wo784fs4oBZ1GXnmGGUefhBWeWHS98moBcI8isgtKEzCJoo6Gq5KAM1iIMr+cso5iDod
	 B1pgt9VHRilmF+Ii+KvDZrOy2s5xDiIVIBNJDa8iSfCnnhQEvduTUfqaFpgCEt85da29J
	 tad138zs+Vrq+zr56dYsu2TTM8/47itVrx5wXRbLUuyoadd+FRs869EiZ4lnjvBZc3zRc
	 q5m0L1YV1Ku60LNuBZyx63yzXbmRKhErDE2GgoFbE5gTxeWlJ7S/Xv6veepi9bfjXI/2i
	 e6i6nm0BzXAFJeNxavCAy91g7Ho6SprS7kWZDD9vR07EjdbARMj0tqPy/trrzemQi8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8B606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF8B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22622585e9.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 12:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862530; x=1795467330; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=lyXw+tAuRY+vzAmb5MLt7oV6TqjlqADVYJGL7Dcck4tDxKf0rDDD0HWaQ5FO2qsHLU
         ruxqmh4TQqmB+ehVIyshPNidpYHwCmYvdsEdr3bs0UuAVpGX1PHqZUG18BR5bp475wIi
         sKYkHCDCRKb8gBPOGVPa6xFHB83xVOGf1dpupqGVdKsauTnBd6kMUhGOoZiXQHzf01RT
         Qc2+sXyf4eMTGjeDR9J7DjqAiTkUkvYYti0mQRl2av7RtIdgMhXBRgTxMhUGsRZuzlpB
         uaRRtiPONL0x36Rcy21ELLbqQ4CA2xHOI094hGRgEosaAWZChyZjYB65JtOafYWEDR33
         w8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862530; x=1795467330;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=YktDnMmVlEdOIl2Iy9vwArprx48BRDdqKwawCr5qKtvD/Hah+PeuSgNYVAX0z5BgA9
         i565glEM5NatS68QI+n555JUx28+RBL8NF2s+a330K4+x1rWwAwSFwBZcpPcnvGWXNzW
         j03gJsM5izQlrnwOX+wryPp9nsfSKTe3dn1RPvUMfpb5Pz/Xo3R6+/1eTG/9V4MWpXn/
         d/1rptV+lmS99UJYyptFRm2pRBd1to1EOoCIRUmsB2U9p6zjKg8wkTrlDAXDpM2KPaWi
         7Yx+fq4vVgTFsK0opD8BelSKzDXyZFLehKyC5vDN6uecWSk5nMucsn6kxaWe6fT1ejKP
         kLWA==
X-Forwarded-Encrypted: i=1; AL+hErGoTrCgfMrgFZoxqxIM9iC7RuVyaFfm4DxGEDDl6RIsR5BoxPICpXdp7xZf1umY8UK/BW+VvTAmlRz2hQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z993nsa/rGAnEILc3cGtI1K2P/LVvMUXu7uOZYzd0o4JitdQYYP
	r9Qbultk6Pwkr2inrIamXZ6/EmAtzjggRqkt3ZQUp2PVlXnfR9ubbYIQ
X-Gm-Gg: AYBFou22iat/yk1z1ZeGbN2wBEG9RMmTk2j7E5Hl8KfEOiIQ3bljLddNd6m1WvfrlWW
	SUiFohz1f73ZV3MV1gPm4sCPknW4uQknjWdzHvN3X4ESn+XX0e14yAyfdATlDszj5M8/0hrSLAJ
	k03itGN4VIaxRKWpNleFc69obG3P46BgKmkaiC1kdTtgzC900OrpnGMMcmkGzEmWrAHAI0sLGEb
	bev3OPw8f4hSFMX7d7uGTQHHqxaq+VflKWMsC6B53gdcakFjUw45TKe4tcqdeyfCo043sMo3hIb
	o2TQatXhFqhEEtFWMLgBi07/Mlbo/HIiCuEtmtpGU0B6I334BV7FA+hT6hC5JKJoYwaJZNSredO
	+xlTbNLwWunZlDdHzrmLlIBeQ/Kz67+YD4yJdpq+xMk19z9l+XGKlN54Q4GVgTuPlqO2AK5+5YA
	G8mRgX8bF1Byj+EXd1EQEaQXGLXXrea4LOjvGyzrar5cDHKve+mYHI1xHYd9Jt5ByU2L9hT1Fm6
	RWiNYFZ5k7gPMO4Be39X91i4KCirJqoskOh6YJHMlkK5nUve+oVwdPg
X-Received: by 2002:a05:600c:483:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4bb55a4f4c7mr187492355e9.15.1794862529784;
        Mon, 16 Nov 2026 12:55:29 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:27 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:27 -0800 (PST)
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
Subject: [PATCH v5 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBTcmluaSwgaGkgYWxsLAoKdjUgb2YgdGhlIHNlcmllcywgY29sbGVj
dGluZyB0aGUgdGFncyByZWNlaXZlZCBvbiB2NCBhbmQgYWRkaW5nIHRoZQpDYzogc3RhYmxlIHRo
YXQgU3JpbmkgcmVxdWVzdGVkOgoKQ2hhbmdlcyBzaW5jZSB2NDoKCi0gZHQtYmluZGluZ3MgcGF0
Y2ggMS8zOiBjb2xsZWN0ZWQgS3J6eXN6dG9mJ3MgQWNrZWQtYnkuCi0gc291bmR3aXJlIHBhdGNo
IDMvMzogYWRkZWQgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgKGFzIHJlcXVlc3RlZAogIGZv
ciBzdGFibGUgYmFja3BvcnRpbmcgZ2l2ZW4gdGhlIEZpeGVzOiB0YWdzKSBhbmQgY29sbGVjdGVk
IFNyaW5pJ3MKICBSZXZpZXdlZC1ieS4gTm8gY29kZSBjaGFuZ2VzIGluIHRoaXMgcGF0Y2guCi0g
cGF0Y2ggMi8zIGlzIHVuY2hhbmdlZC4KLSBUaGUgc2VyaWVzIGlzIHJlYmFzZWQgb250byB2Ny40
LXJjMi4gUGF0Y2ggMy8zIGlzIGZ1bmN0aW9uYWxseQogIGlkZW50aWNhbCB0byB2NCAodmVyaWZp
ZWQgaHVuay1mb3ItaHVuayk7IG9ubHkgaXRzIGRpZmYgY29udGV4dAogIHNoaWZ0ZWQsIGZyb20g
dGhlIHRyZWV3aWRlIGRldm1fa21hbGxvY19vYmogY29udmVyc2lvbiB0aGF0IGxhbmRlZAogIGlu
IHY3LjQtcmMyIGZvciBkcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMuCgpTZXJpZXM6ClsxLzNdIGR0
LWJpbmRpbmdzOiBhcm06IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpb
Mi8zXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sg
MTYgWDE2MDdRQQpbMy8zXSBzb3VuZHdpcmU6IHFjb206IGNoZWNrIGNsa19wcmVwYXJlX2VuYWJs
ZSgpIHJldHVybiB2YWx1ZXMKCkJlc3QgcmVnYXJkcywKRGFuaWVsIENhcnRlcgo=
