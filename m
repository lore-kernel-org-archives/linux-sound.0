Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108B521D59F
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742554168; cv=none; b=bTJrZG+zJa7X1eUr8sCkIs9EZcTDj7mqbh3V9MZdlcvrIpMwdb+EFpodtM5Ul/VGuzEMt1noJ51oRMv8Vf//32E0OD2x6gxrtjrlxNPKMXEnqdFVqAPTTjhvACdXBZDNwq4x2XofxnFP36XnAnemece8IAVVdr6JnNzzDrcxQIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742554168; c=relaxed/simple;
	bh=AKiz805D4eOoRMrIxzZ76eB1qkCaMajH61Sf5nmAkB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LjcwpFQoEKucrNauWqQlzOBCo1Po+2uTSHX1PFdt80NDozoR5nV5NYMMmdC1Xiq7F1AZKSIKUqHVCbECH9X2k1Dk27YgQ7P4TXKZoszYzdr+A+k/uojBtCr5z+qzjGpd/WAw/DABuoeUribRp7RWhgfKzqLiF6dCI1eXJnxYbhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=nFafVQiW; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nFafVQiW"
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E1AC43F322
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742554162;
	bh=wk3p2RHEb7IC5cBg8qDlCuH+i3pQ0PXB+Ife22F3hrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=nFafVQiWMoSZW5NH93A64h6Wp84VnyYMgY0tqDpsvX9Kh3FPFO68ZoizoTBzwoklo
	 LtCYEAF7motp3QhwaHgEIhaBR4sydjoSpeQuo9TM6Ob84NqVmIeeTY1Kw/WQl3Qvi3
	 dJ3x4DZIV0K9QhQo9YrWg+OMKYtNnb9Xak2qHEyI+wo/FXQxu0FgrxaSMzCWu919zn
	 v1baPq3m3YzR2ajfEcPPuWtNan3rriuGtZVm2ljC+4ni7cZB9lUONxQqVFSqIN9owH
	 PDOW+Q9f8TnwMvdxflW10dOEU9RW8hqVOKoWLTiU7kbaY7KIFpG90aLcxaTyazqSrB
	 7SDNvBV6ioxSg==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254bdd4982so44201275ad.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 03:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742554161; x=1743158961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk3p2RHEb7IC5cBg8qDlCuH+i3pQ0PXB+Ife22F3hrE=;
        b=eVH/OpSQGj/GJ6q+dJlA3UjM8iqdM8MzavXU/VMAcFROihQe/btNK4yhVdtpmythko
         zix1iO5B3NgFY4/VA88puC40sHL70+xd81IeSbCxBLV6Ctoa6t3z2m9tlURPvFH6Ak0Q
         0f2uguXmv8bkfJxdxz6n8+Nju2gG40riGIbsUty2DAPpC4yRlvN9PGEOJz4jGAeaPUfj
         usfJn7/43uPe9VXvngc++LrOnmHI8vqvTMzmiUr97wklx8IiLVfa5yFVWG7MTt14zLX8
         y+3nGYX2Ho+4vhn29YfL4X3yunBuQWftn3yWFzYGyzG0SkPbs1b58D1PuxQo0CB9zYdX
         sccw==
X-Forwarded-Encrypted: i=1; AJvYcCUY8duYpYD95yqCnveKt8m4yE0OIKQoC5kYHKv/lQwQ8rdvRT+W/jcOM457YT7KOVlxq2fp73jFuAyDdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHg5jZXasI7YBleQhbC1ObPTeM28RK7xF7jZTZYFo8Ywj9LT9+
	807NupPtW9hNxu7XjvnG319dLwE83bVYoQkJMVwLCReqx/i7RfQCq6fKxbkRm/O3kekbWW+yDy5
	Z/4DUmFETxJedhe81DSvSRGRxCXb3SCIJ8ahtd/FJcPGfShtMeg2shJmyrhAZw19o82K4ECggE7
	iK
X-Gm-Gg: ASbGncvBNnTHGa+HYvR6+5bjfyo2u2BhPhPAn+OqS+6vdIAYLafFnX1clpmvH1nFEv2
	/3nraqQhzi/ddUx1PQ6N2Ob5crTVDSYQPfri/4sK9HKf0tzv53ayCxvFscAepge9K7QLeUuzFal
	+uSEFARmpwxBT0t7Ui/dH2ChtDg66WDYtetcNNu69bNr7LC/4HIbtCbdbJNCj1IcYPPElFNkKfN
	i4+KCqk9GEFTWU0Nj9jD7qITFFDMGfteEjrrrkjWXMcbwGwDtGm6XFBpxeOUku9et9c9fLD5uZ+
	bFGsDC6L0YxjTKXQ2fuuSmNanBFw90vEd6UYyOBcZEiqwg+DFxZNo0tLCz+Plw==
X-Received: by 2002:a05:6a00:808:b0:736:55ec:ea94 with SMTP id d2e1a72fcca58-73905a5255dmr5427981b3a.20.1742554161316;
        Fri, 21 Mar 2025 03:49:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8CE8cLdwjqNwnbScAp+7k6TEaCT0uf3ktobtaMxTgvHAj1XlubrJEYiUV3y0FvyGo2+Xq/A==
X-Received: by 2002:a05:6a00:808:b0:736:55ec:ea94 with SMTP id d2e1a72fcca58-73905a5255dmr5427947b3a.20.1742554160896;
        Fri, 21 Mar 2025 03:49:20 -0700 (PDT)
Received: from u-XPS-9320.. (114-36-251-180.dynamic-ip.hinet.net. [114.36.251.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa92bbsm1589353b3a.16.2025.03.21.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 03:49:20 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: simont@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH v2 2/2] ALSA: hda/realtek: fix micmute LEDs on HP Laptops with ALC3247
Date: Fri, 21 Mar 2025 18:49:14 +0800
Message-Id: <20250321104914.544233-2-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321104914.544233-1-chris.chiu@canonical.com>
References: <20250321104914.544233-1-chris.chiu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More HP EliteBook with Realtek HDA codec ALC3247 with combined CS35L56
Amplifiers need quirk ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---

v2: fix the quirk order by SSIDs

 sound/pci/hda/patch_realtek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 30d4cd93dae1..5bafa8817bad 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10734,6 +10734,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dee, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e14, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e15, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e16, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.34.1

