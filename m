Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9008224AE0
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918203; cv=pass; b=Y6spCUKhyZkpPWocuQwgbMfOL4O6cO2Rix/G1W+zXeURjM2gCB828Wzb04Ry7QyiAXuFi0/3AiSu6zVjm2au2VmH91Dmo0q3ljKXIkOuN7ip//V/KMMsyaAN+AMDs9uDz4OIlayvBo/qvrJj7h7AZ2ewaXAVC8aaw+33AX16lrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918203; c=relaxed/simple;
	bh=iwuUC3ZdNskENtzF/oOTbZ5CAjumTbdCZhPSZbHLpPc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=sdSED9atPuqfBe909W+YVqEPD1EBrmLzkfJrNETuunieYjxPnCwXjaHDOYybKOWUhC0AgN+UlTDTgZOjhXLl0VcUd1842+slLixyyF8BuATMT9w/OtdCyp9Cn1ns+Sm4+K3BFkGF+a+E6Lbiax9+gTqhXxjlbhujoBEkoVbmOMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTsOshNQ; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTsOshNQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439c56e822eso815799f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 04:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773918200; cv=none;
        d=google.com; s=arc-20240605;
        b=MOmiDzhUFyE8Ff3zR+EssYjrwg9W5N/JNQ9ZP7dSdd0OdNHsDvashzEaIXDO4uOcbh
         jfDOHG3ePnMuCi0bLzSNpwNCezSzEcbgw/qvhPsKdzHHJAR/IiDvftRvvfxRz97AMQJM
         BX5278B9pa0xuJ8yNjeuYO2wOqPysme8fpLtJU1j8WJEpWMFceSOYob+aoHF7nLfBqYg
         STBRyPLD7D30u/vJTA0VnrQLM0vzEfp6hxrh6VU6OMAIcMoQhLEJBi5PdfN97ynYYVCj
         dJib+/WUXnF6FvKklf70jxITMDIzXPCiuA4r7lidQTy2pcKPjSowQkQWZz6CfRstjLjb
         ja9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OEt3Eehp+//Zh+MKtSaeYP5MxSgT1obszkRpWocZi6g=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=gw7pnvL59PjxA9J3DP9wFLXT0Q3cfNa3H+i8o+r8LJLoFSmdaJ6D8TF8jsjVpfXehC
         xEvMDOlBlhKXnqgFyu4bu6x9M/Z5ic5sSR1OVC8ZPs55DnIs+hOJbkJPqyCAckPpMCpv
         H+L3rGTQZR/A3abIxgrT7YhiLxckbVqiHiqp59eQTK3fwmm4t1E9w2RrAkxMRFxmrbIZ
         fTMwPR5eOyt8KqOxXPBD+xNA4vuxfjnX/t+RQTvoj8juLFRr7KkYLbTh34RHG8bWCaVO
         MwhMJrsy/ZkiiIyehckio4EmoT684lo+iwE3H/byiAzYXlt4FMHKpvghS68l7pPlh7aD
         m/IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773918200; x=1774523000; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OEt3Eehp+//Zh+MKtSaeYP5MxSgT1obszkRpWocZi6g=;
        b=PTsOshNQwt6i3ttSxB7SZbPQy4O+gFVqZEqS1s2JfDpg5f7KDF2TS1AsvCwxcn4KNu
         UeFv0BukWBLrAOfFW2Czm4NiBfQx3KVwoiEgM2p5NVLMHbVqZn4JmO0OvmSNB1S9qHyF
         FKMiGWxkf8gbzWAZbvMXV6Hiyf8ld30g/l/gPrqcr6iOfw4ganJpXRbZgY1GCyXq7c6k
         yCJ+pO1hVnnDYa4HqVVi1Gq96nqp9Jnf+LBlEPyieIaBaTMtdl+vi+/+PSZiDj4PhDpY
         X/fxPs5kb3/Wflhz+vJ1XdvSqjhIG5BY2k1MmzbqwaJxCOKWIotOSQIeLzpnurtvBz2t
         Q9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918200; x=1774523000;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEt3Eehp+//Zh+MKtSaeYP5MxSgT1obszkRpWocZi6g=;
        b=gNKLOL1g5ncVBQnNu33avmX0Q5iAz+OQXUAiM+dq8WUHccH4bGmjI8cci+5BC8wA/i
         SJ84z3C35edShhqhK7kHktSts5Jx5pgJZEykaEcvd3Ivu+P1p4dUue45z9jq5sPGZuBj
         OwsYqOoUeS4UKrvFC7ZpiXs4h/sGruZsMAkcCMHFAB2W87Ci+pUzI5iIBFchFPfjm9JA
         nvaWfeapkq/vMXIOxBq/uJk3jrnsy1TjusgEdhPSN1Fw2RcGbxUWFytOyy3z9qT825VI
         vgmoJ2xFD7inPA+En1+4VBLNb5fWX0ZgjXWT9tMWLnccxJOabtApn0Y5F67A0I0OlVnn
         gYSg==
X-Gm-Message-State: AOJu0YwnHz6RIht7cktHpZ+9ejwSMhjgFFaFdHchZo/mH/oOGv2zZCB0
	4PJfaAgHevgKoE/WpDgi90PTxFqDdXuq1PeYYQSrcZ80utiXD6LHbhh0FJf56B8IhEZ1dvAn0wG
	LYzM15ESDj6HWITLak5xZu6ixHq6bZ+kjXTj+dnA=
X-Gm-Gg: ATEYQzwf7DYDYlWUdOjWFcLxTWbsj3DtSjxVFBnZ1q7w0XjAR+dk2gzn3jN0CvH6ONF
	47WHK3IVbbXT/EQhjuigjfdAwdwBTt5zdBdXKTKVpV58/NHOBDc2L0nI7zOHY4Q+Skxnc5jphBC
	UFDEOGOzedQOWOVCroGvcEE5qGN96XIaUTNdniARJAvYWMNAjYzJEzsUI+wYT572+kqx1rL+VoS
	gj5XOBy2eifIGKdTtoEQn4pCaT0vPEtWiHGwutM7Elglpno66dvvBAISZ2QwC5ohHL9oVB0t2vG
	z4ne3TjhdENK0l0=
X-Received: by 2002:a05:6000:22c8:b0:439:abcd:b314 with SMTP id
 ffacd0b85a97d-43b527aa5c7mr12115039f8f.18.1773918199575; Thu, 19 Mar 2026
 04:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Philip Willoughby <willerz@gmail.com>
Date: Thu, 19 Mar 2026 11:03:08 +0000
X-Gm-Features: AaiRm504Fin-ZPOrZGQOFgt_QXD97yLfXwh6ETt-UT3NSBDSdKXIRqTXX73Wcpk
Message-ID: <CAKSkzpui0HAx3LSvxOJFi7opb0sR-3oy5Oxw7uYjMep5ZHVJJw@mail.gmail.com>
Subject: [PATCH 1/1 ] Support POD HD PRO
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I apologize for the previous badly-formatted patch.

The POD HD PRO is a POD 500 in a different box.

The USB PID changes but everything else is the same.

Phil Willoughby (1):
 Add Line6 POD HD PRO support

sound/usb/line6/podhd.c | 15 +++++++++++++++
1 file changed, 15 insertions(+)


base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
--
2.53.0

From 6f3211504f7091fb5ecab36daea4628b3fa4f0db Mon Sep 17 00:00:00 2001
From: Phil Willoughby <willerz@gmail.com>
Date: Thu, 19 Mar 2026 10:54:40 +0000
Subject: [PATCH 1/1] Add Line6 POD HD PRO support

---
sound/usb/line6/podhd.c | 15 +++++++++++++++
1 file changed, 15 insertions(+)

diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index ea1324c22f46..f32712286642 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -28,6 +28,7 @@ enum {
       LINE6_PODHD500X,
       LINE6_PODHDDESKTOP,
       LINE6_PODHDPROX,
+       LINE6_PODHDPRO,
};

struct usb_line6_podhd {
@@ -442,6 +443,7 @@ static const struct usb_device_id podhd_id_table[] = {
       { LINE6_IF_NUM(0x4159, 0), .driver_info = LINE6_PODHD500X },
       { LINE6_IF_NUM(0x4156, 0), .driver_info = LINE6_PODHDDESKTOP },
       { LINE6_IF_NUM(0x415A, 0), .driver_info = LINE6_PODHDPROX },
+       { LINE6_IF_NUM(0x4157, 0), .driver_info = LINE6_PODHDPRO },
       {}
};

@@ -542,6 +544,19 @@ static const struct line6_properties
podhd_properties_table[] = {
               .ep_audio_r = 0x86,
               .ep_audio_w = 0x02,
       },
+       [LINE6_PODHDPRO] = {
+               .id = "PODHDPRO",
+               .name = "POD HD PRO",
+               .capabilities   = LINE6_CAP_PCM | LINE6_CAP_CONTROL
+                               | LINE6_CAP_HWMON | LINE6_CAP_HWMON_CTL,
+               .altsetting = 1,
+               .ctrl_if = 1,
+               .ep_ctrl_r = 0x81,
+               .ep_ctrl_w = 0x01,
+               .ep_audio_r = 0x86,
+               .ep_audio_w = 0x02,
+       },
+
};

/*
--
2.53.0
