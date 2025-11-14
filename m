Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC632A3D4
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138148; cv=none; b=GEaGzDaGoEJKxKTMewyGH0OWJpTDt52F2GIBG2xbhCnHrUUG0waNSiVReUqDrGr/ufBgIK3ph8TvzdYsEHS/G7O2b03MIsVd9OCQU4PcpDCqBsSR+OfAqnr8afBx29zTHM5XC0c+gzazAmL79BU9Hs9h0cGAGkpeRnNTZqKYsyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138148; c=relaxed/simple;
	bh=S23DfzuMwHJ2HsRvA7NPIMS/ZraCea9JZh/OX4y/a0M=;
	h=Date:Message-Id:Cc:To:Subject:From:Mime-Version:Content-Type; b=NdOSN5pqCN/Fj3wbv5/EWsXaL6TeCfqzawsn/stXZHLWNgWOwtXCbqmG3k4v79df2F+4i94E5fbFxl18hmPTklN2Sk4QnVBT1N7RDtedzEAzxfRi4a0EMkEaNQIapK9+L9zEAhQLKjJkmcB6bsKZYbIKS4ldI6pEqPY/QWqmRxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=ktn9PsAa; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="ktn9PsAa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:To:Cc
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=KDPwQMcIXKb4Q42n3ZxrQEnK90OcuSE6jm2CudGK2hw=; b=k
	tn9PsAaRwgN46TtSl0RIOkKEl4T6QU53i6nEYt2BkuHKpvuscbBcNYBdRXxhuhRJcYX6lFvx1cjeX
	de5Rm58VUUwLa8nIozFmkC8dQTKUdIRkFBqMBx+sxSSC6Xcz6WJbj8CdeHHL2tILj0aiELIAUAMq2
	KdmEZuUXeruqIGnAjIQLHOfPBC6y4aElmnjkG45n7h1cCbRNvBC3mC9/2uACCEYazYWz2eJfvNQC9
	D8+mfg+v8P9R6CLFhZzU1ORyaHbHYmQuH1RltwIp2cZfpdk0vs393+jMoGOH9bugV3ZET9mvFyJbx
	pn3w9taNToBwW59o3uzmCxkH2FgBmd3CQ==;
Date: Fri, 14 Nov 2025 17:35:41 +0100 (CET)
Message-Id: <20251114.173541.1765928837929818015.rene@exactco.de>
Cc: Jaroslav Kysela <perex@perex.cz>, <tiwai@suse.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>
To: linux-sound@vger.kernel.org
Subject: [PATCH] fix cs420x MacPro 6,1 inverted jack detection
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Turns out the Apple MacPro 6,1 trashcan also needs the inverted jack
detection like Mac mini patched, too.

Signed-off-by: René Rebe <rene@exactco.de> 

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 06e046214a41..dcd58f0b8bdf 100644
--- a/sound/hda/codecs/cirrus/cs420x.c
+++ b/sound/hda/codecs/cirrus/cs420x.c
@@ -643,6 +643,7 @@ static const struct hda_quirk cs4208_fixup_tbl[] = {
 static const struct hda_quirk cs4208_mac_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x106b, 0x5e00, "MacBookPro 11,2", CS4208_MBP11),
 	SND_PCI_QUIRK(0x106b, 0x6c00, "MacMini 7,1", CS4208_MACMINI),
+	SND_PCI_QUIRK(0x106b, 0x7800, "MacPro 6,1", CS4208_MACMINI),
 	SND_PCI_QUIRK(0x106b, 0x7100, "MacBookAir 6,1", CS4208_MBA6),
 	SND_PCI_QUIRK(0x106b, 0x7200, "MacBookAir 6,2", CS4208_MBA6),
 	SND_PCI_QUIRK(0x106b, 0x7b00, "MacBookPro 12,1", CS4208_MBP11),


-- 
  René Rebe, ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
  https://exactco.de | https://t2linux.com | https://rene.rebe.de
