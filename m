Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F90331EA8
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156424; cv=none; b=o2o//T6lDbvCtvY429QUu9y5XcZ2vKgMrAyALaEtyuuNUrL9ekFiaDUXyS7CY/rcIQ7uBoDc4G63fapbHh9/MDww7TXDlhJNXkO7VGVNyLiALuadxaZaOHemZ/DOqvmT5WtODmPUXTUS2eF59+lOnU3mTugIJBh1hhYKtcyDYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156424; c=relaxed/simple;
	bh=uzU7RaY2K9+73Q6YK9gtNJvyk4mkQ/ySuzyx9byGgIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nV9QRAWjcUScy8lqXConf6gK7U1YaYcOMIpmRCwl+NMJXAJ1rDNxJlLtHNCS8mUJixD0MiXnSU66M0+pAfCNyToa1HNR2UBxrZi5u+9jE45hWsrjpyhZZqKA1NpcL0IhTxlfTcccUlweRkI2aiG4p7qpf9SUAtabHd9aKqACL+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsESacbh; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsESacbh"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so629054a12.3
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156422; x=1790761222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnQHrDxAyd1yhTRUYQ1mkIzupirTqXVm+66Gi8J/eBw=;
        b=DsESacbh0dRI66xu2NzwLZxlRdW+armDGeYolMnRwBWt60G2n18BwQ+S8/vRrxIWVW
         /cBeIfKdUiX5iAt3PkW3D7lDNFlgHpPukSxZ9XLcfw/KWSbRyf8ElBW5W2R+YYkPRssm
         ER78MU5KYWkhNW8OElrXTcDLPd26iojs5lKx7d8dTxFgxD7SlF1rktZFZ+od1ziVE4iJ
         J7I0y9JnUMssqP6MXLG3eI9oWvKbEf3e8Ycj7rcFtreDAzDAyUjRXr4JtmggLfEh5H74
         TkvNbC11NWlVzzJoZSZDBfOszCS+RFH6yZbyA3U/2t+9iu9ldHYI6vqBfHUuOnDe2aTG
         oLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156422; x=1790761222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnQHrDxAyd1yhTRUYQ1mkIzupirTqXVm+66Gi8J/eBw=;
        b=OsV1KXLCgIAd4nemESUcG8XJucws9AaPR1+j1Pa2vTBaArs4WCBhM5Kk66zET3Q8J9
         1QcJV4GDR9xRBKq+ID74w7LdJREmPRR28dZtFIz8iQ/eybgN9JCIzlGdLuyxzIOxZuNd
         VWdrF6yXrIhvgRzY+oTsmHp3oXB0Ryt2OvKqrUz9ihjjD4+xpMyDa2w2SiMLPxVdicbI
         ql7Cf6Z27J/8IzSzfCdAY6hHsipsDZN4uIh7DaRD+1/P1nc1s+7HBaDh1etPWOxoAdCX
         x2Bzedc7d6w5YiZhmsSWpqCo5cLdQSsL+LfapffachtXUHEFXQJMSk/KnJG/wUkRZ0hP
         96BQ==
X-Forwarded-Encrypted: i=1; AKwUvByjzfW+6Ni5jY6VdD5BkYqvV2P45wYVhrSFgve3bcK+QnHbJ4cCcpZRSh+atsZZzH1yzDlh56D9XmkfmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nni3A34piH3v6LkqpMR+dAJ6kXjX1HThPqoztry7O2mRySUNJn
	5GkOq47epG0i/ZVIkUpejtQW+6sADcxHkIPCvc1b+q7O9MSMPfqDVsKa
X-Gm-Gg: AYBFou1D2pmE21lz370lV5q8zFRkFqCbPkw1OllTXC5/9OuFQ6Ft+5XfPJGc1ZgOnlF
	pXAiFg/8HrdtIFzEVtU6cPgipIi4YaF8b7rW0e33P9nYcrmx/VKD8EezqRZXWNIDuLYIW8HUgyj
	QBHSm8WqOmdsVMgzytOW22ErntuIRm4zHH9yfP/ClSCmC6aV9QYN9krXZaoukpqLfu+47tO7aJJ
	HHbW+P0ISJc0O/x+XZBIDW1hA/QqN9zkEYwBFOJ8IqSCn7DKs5ulbqiB42R8ohms0lT8iWkU0m7
	29iS6/ybDuz/wwtd+3l5IzZ50pq5+ubUCuNLy6etC40lxBBaMg7dy0LmIeA7F4YzG12WNY0/l5Q
	X7iJ2YWb48NvRoPgQlFG9UN3MsYwoQy9L5Ub4k2ilqPnvQTMDYqdUwDPgLqidvPIDFTUfu2IdxF
	4ofGSpVYVxcBfOlqjo3Hh4AXKTmiaPE2Cho/yjAVVN6TmSlBI9/NRacFuwEtTIBz9ffnGdAeMia
	jz2ptL+NCPw9o9DGA==
X-Received: by 2002:a17:90a:e704:b0:39e:6c69:9b8f with SMTP id 98e67ed59e1d1-3a07e693a28mr1695259a91.52.1790156422193;
        Wed, 23 Sep 2026 02:40:22 -0700 (PDT)
Received: from fedora.tail6c1c0e.ts.net ([2405:201:c411:b12f:aef2:6452:fd6:d00e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07fa5fd15sm1333168a91.1.2026.09.23.02.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:40:21 -0700 (PDT)
From: Tarun Noonemunthala <ntarun2000@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tarun Noonemunthala <ntarun2000@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP ENVY 13-aq1xxx
Date: Wed, 23 Sep 2026 15:10:14 +0530
Message-ID: <20260923094014.58867-1-ntarun2000@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ENVY Laptop 13-aq1xxx (PCI SSID 103c:86ad) uses an ALC285 codec
with two speaker pairs: front (pin 0x14) and bottom (pin 0x17).

The BIOS leaves pin 0x14 as [N/A] ("not connected"), so the generic
parser never enables the front pair and only the bottom speakers are
audible.  The vendor driver (RTKVHD64.sys) programs that pin with the
value 0x90170150 and runs the HP amplifier initialization, which is
already implemented in the driver as ALC285_FIXUP_HP_GPIO_AMP_INIT.

Add a board fixup that applies the pin configuration for 0x14 and chains
to the existing amplifier init fixup.

The pin value was recovered from the vendor driver's own configuration
data.  The patch and this changelog were prepared with an AI coding
assistant (see the Assisted-by tag below); the change was reviewed and
tested by the submitter on the affected machine.

Tested on an HP ENVY 13-aq1xxx by rebuilding snd-hda-codec-alc269 from
the Fedora 7.1.10 source and loading it: the codec now reports
"line_outs=2 (0x14/0x17)", pin 0x14 comes up as an output (Pin-ctls
0x40) with its amplifier unmuted, and both speaker pairs play.

Assisted-by: OpenCode:deepseek-v4.1-flash checkpatch
Signed-off-by: Tarun Noonemunthala <ntarun2000@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8f55c3c00..35d7d2f87 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4139,6 +4139,7 @@ enum {
 	ALC285_FIXUP_HP_SPECTRE_X360_EB1,
 	ALC285_FIXUP_HP_SPECTRE_X360_DF1,
 	ALC285_FIXUP_HP_ENVY_X360,
+	ALC285_FIXUP_HP_ENVY_13AQ,
 	ALC288_FIXUP_DELL_HEADSET_MODE,
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC288_FIXUP_DELL_XPS_13,
@@ -6412,6 +6413,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_AMP_INIT,
 	},
+	[ALC285_FIXUP_HP_ENVY_13AQ] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170150 }, /* front speakers */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_HP_GPIO_AMP_INIT,
+	},
 	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_ideapad_s740_coef,
@@ -7400,6 +7410,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x864f, "HP Laptop 15-dy0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x86ad, "HP ENVY 13-aq1xxx", ALC285_FIXUP_HP_ENVY_13AQ),
 	SND_PCI_QUIRK(0x103c, 0x86c1, "HP Laptop 15-da3001TU", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x86c8, "HP Laptop 14s-dr1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.55.0

