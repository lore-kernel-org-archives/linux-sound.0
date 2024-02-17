Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5A723D0
	for <linux-sound@vger.kernel.org>; Sat, 17 Feb 2024 04:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708144053; cv=none; b=JJJnyQq/MMjlb8SbyUREFatlXJoTHMCze9zjYe0euf2FuuxYPAVN5LOalNs/jZj0CuH78CzVwghfaOLXIn5vA3dR4Z9BouXQgikI24z6z0fYfAdzM5ex6htouf+I+Q5OxO4+HHO+kV6VWTzMmpaIOMBuUSPtOqns5GYuT3EdYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708144053; c=relaxed/simple;
	bh=HHYqTm0Z8JqKy4gEMtSEjbA3SGiKSR22dWsJwyHi78E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=njx1TFSd3ZGNrdOIHil/+OLGPvp9o9ejjaa7NvZ0OSZDS5x+7Z3S9jVWuIsMRzscRHrjYDmgxziW/GgIjLsZ9MQoO/F0Y2iMgDRUQ/HsbbxNd01gWts8eRhZwNCNVl/jaj77qKLxPydgxdfDtal6vncc6UOaSR2lPdPOv0fORf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiMMLC1u; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiMMLC1u"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-20536d5c5c7so1048462fac.2
        for <linux-sound@vger.kernel.org>; Fri, 16 Feb 2024 20:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708144050; x=1708748850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/d8W3S1LZchKj4coTZV/wu3GInnbrfMBUIfxSiwG5c=;
        b=eiMMLC1uaZufbiSjMxgf2G+MJZIo1KQxOGJpOiHw4tou/nCnQ9iglVGhLT3rPcOiIF
         g7mFOqZM0u5l+0nL75Wt576u9IM63DkMHoCKesey7II6+nCHgnvVCodMXHO+vrCSdMYR
         325OBBVgebd5Gg5Zpy29NUiBKW57MYvnFYc4IcEE9Dc6LyDerwmbAcBFQEfwT+iB9W53
         fQ9+oFnnquRhvLOnxw9diYBj7tKTIIPe1VYO9oFcU5xME2IbdCaKKjmFzixz1ONpUhfO
         6uzaYQwIETzFa1yoWv3Nr3v7LBEzvoOVDen4ZfHCRl00Yl6/O0EgheJ7yib0UR1C5WQi
         pxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708144050; x=1708748850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/d8W3S1LZchKj4coTZV/wu3GInnbrfMBUIfxSiwG5c=;
        b=kw/SRcSnzYfgzMo3tqSNrMvGA8ZE9dN7O5vyyIem6uGg71YHbeR3AAjfslSN4K+vsB
         jQrlcvUt2pkz6TtakK33egQMNvAN4FhVWg3Pna2I4IAxuWyx+BjJbpi3P8cLxkPAqQZd
         HmiiOLk3hDJP6sZEgq8JOlu/eVWkzm+dQaqmBKND+spRfIV40S43OVVulqRL7EgqnKt5
         fNdbOm0LA84iWoGxbZqyPmzzR+kfrfKuAUUqiP5WoCNhOLK+eYWorcqphRxR98SH313X
         9ubK8cK+MYaEBEg3Z0s1e9NcL3Y8LX1dNzh84dTr5B8ZUlv0Iy5RxtLMjxIAZKx/0kAj
         8Giw==
X-Gm-Message-State: AOJu0YxTXeabqZzOc3h3n/8hOOzlasS6xfKudCdj5BdmEjnwDtU9gkVT
	XIW+NZjxCanLkqwC0tYpNOqaNYNIF5YSSYGJ9TyYTXHFCYaD5XG5yk8HLyRc
X-Google-Smtp-Source: AGHT+IHGAjEEqNfI9Th7Ws43cb7NZLCWuf+AMB42alnjYKgTWpnKspHsYcovfsv09bgOlZIdAjNIpw==
X-Received: by 2002:a05:6358:2c8e:b0:17a:c9b2:607c with SMTP id l14-20020a0563582c8e00b0017ac9b2607cmr6944394rwm.27.1708144050443;
        Fri, 16 Feb 2024 20:27:30 -0800 (PST)
Received: from localhost.localdomain ([49.205.32.18])
        by smtp.gmail.com with ESMTPSA id a186-20020a6390c3000000b005cf450e91d2sm699286pge.52.2024.02.16.20.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 20:27:29 -0800 (PST)
From: Jay Ajit Mate <jay.mate15@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jay Ajit Mate <jay.mate15@gmail.com>
Subject: [PATCH] patch_realtek: Fix Dell Inspiron 16 Plus 7630
Date: Sat, 17 Feb 2024 09:56:39 +0530
Message-ID: <20240217042639.12374-1-jay.mate15@gmail.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Inspiron 16 Plus 7630, like its predecessors
(7620 models), has unconnected top speakers. As the
controller remains unchanged, the speakers connected
on NID 0X17 should be connected to the DAC on NIC 0x03.

Signed-off-by: Jay Ajit Mate <jay.mate15@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0ec1312bffd5..f8dfbf17522b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9735,6 +9735,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0b28, "Dell", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+	SND_PCI_QUIRK(0x1028, 0x0c28, "Dell Inspiron 16 Plus 7630", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530 (2023)", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0c0b, "Dell Oasis 14 RPL-P", ALC289_FIXUP_RTK_AMP_DUAL_SPK),
-- 
2.43.2

