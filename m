Received: from outbound.ci.icloud.com (ci-2003c-snip4-11.eps.apple.com [57.103.91.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B65F4E3772
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003455; cv=none; b=FHhJjVV2Ug/mKZqK06mYP3WzaR6Ba2+ZYzXmTKIhMKLcd3RnwO4Z/+hRD7GNcLe7vTGw2tdoBGDsbuUbn0D5j9uu9N3DhgTY/21606jRm7xUacmh2Ys0/vDMQb4dBSjhVu6WTw/b1UKdv2m5DFdC00tnP/rC+VgURXhD3eOQQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003455; c=relaxed/simple;
	bh=9J41KpXy583620lYLt2ot5D+uQKtK04JtcRtKQT2HlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2H6O9D9JU8KM90PfxFQiuA6rUbioJfkoNH7vpVlQMiKcL5K5uV7eDMNUCsxjm3Eh4DCMEITC6HLPgHXcsIuGYk2U8csCDsimsn6/tONoqXv+J+kgEsikFdAN305UFfg3BxqCWw0icUrTHRJ9OlwSoE6bMtK5NmtjU9pkMm6cdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=PDLXYgid; arc=none smtp.client-ip=57.103.91.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="PDLXYgid"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPS id 65F40180095C;
	Thu, 02 Jul 2026 14:44:12 +0000 (UTC)
X-ICL-RepId: 019f2349-93eb-7f56-9e88-39978181e68e
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQxWBlUZWgpHF0kFVBcOVk1PGVcEWkVeCUodXQZYRUcReRFQAVgeVl5aF15NUQ8PGVoUXBhTRVEfVFhBDgpcEhhcFFxQWB5GElYNXQkZCFteUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DWgdZA0QNSQdaGVoCQAxKAEAFRkQRXRFeQ1sSQRVXE1xDQgpyGVoUXBhTRVEfVEYTGU4bV01QG18CQg8=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1783003453; x=1785595453; bh=jB7iw3ZA/vLJdxMx2jJp2AaIeG4Ubg/HppbFZFmApXA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=PDLXYgidQr3RthSxnkY3zQoksZF2XehMciVgp8mcnsj+TbZBEvF3cfGWzN2cNznDVh20534pt1KCyD3P10XBi55JdF3X5gwITn8gLR4LCezZ1ygMt81qZYMZik9J8vKXPVSV4N/ofzG6B4rRlEbH6KUap/JrSSHTn1FMsOtgFXUDlfDd8ieGnxye5brnHBqyLByzWNpIfDwBFEu4MlVKE1furc5jOS5woyiGVdWh5mSb5QjXe2row9AknM6Q+ihhdXde8eYfIIgtFurotmkWIAxjHObSWlMwQHmY/9dw84WtJiQlmBhzbiYV1yZwmE9LtfkAvLtoa+6dKMCl2dWhFg==
Received: from duduphudu-alienwarex16r2.lan (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPSA id 97E1C1802240;
	Thu, 02 Jul 2026 14:42:00 +0000 (UTC)
From: Vadim Lysenko <vadim.lysenko.ua@icloud.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda/realtek: Add quirk for Alienware x16 R2 speakers
Date: Thu,  2 Jul 2026 17:41:46 +0300
Message-ID: <20260702144147.100523-2-vadim.lysenko.ua@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702144147.100523-1-vadim.lysenko.ua@icloud.com>
References: <20260702144147.100523-1-vadim.lysenko.ua@icloud.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WFVtn57GLg9hagivtG49ws2q4QwepBKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1NCBTYWx0ZWRfXyt+/dNmkKrCC
 AohT1FVYxAS/ysJYxZkB/F85qoZ9zpXXKyfWO2+l3YBvMc+8uc8qGDrmmomYbnmLbx77CJBuMqd
 qYGA9PQAztMo6h0/Kv3bpgxQeyOMBnfAGqwBBUmISASdbrSJ7CNuJrp+o6dGozS/T0l/lGl/FKU
 fBuPMqjFqhIUXIdiCD7ywJUGwBwFlUUwG3DZVFWL8ADVjOg7xeOUcRX7tTYn34gWGI1RaSPcZlA
 iv8zA+xw7kwt3xkyZnOgZ0q+TooB4tnKH5Jj1ArszM+OjqO8xvVGrVJXzrS/HdcRmz6MOZIRm0N
 pdLq8u1B3me0TcxdTe9
X-Proofpoint-GUID: WFVtn57GLg9hagivtG49ws2q4QwepBKr

The Alienware x16 R2 (Dell subsystem 0x1028:0x0c90) pairs a Realtek
ALC289 codec with two Cirrus Logic CS35L41 amplifiers on SPI - the
same topology as the Dell XPS 15 9530 (0x0beb). Without a quirk the
ALC289 speaker pins are not routed to the amplifiers (speaker_outs=0)
and the internal speakers are barely audible.

Add a quirk reusing ALC289_FIXUP_DELL_CS35L41_SPI_2 so the speaker
path is wired to the amplifiers and both CS35L41 components are bound
to the codec.

Tested on an Alienware x16 R2: both amplifiers bind via
cs35l41_hda_comp_ops and the speakers play with full range.

Signed-off-by: Vadim Lysenko <vadim.lysenko.ua@icloud.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d9e2384fc..01047f6ce 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6883,6 +6883,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530 (2023)", ALC289_FIXUP_DELL_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1028, 0x0c90, "Alienware x16 R2", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0c0b, "Dell Oasis 14 RPL-P", ALC289_FIXUP_RTK_AMP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0c0d, "Dell Oasis", ALC289_FIXUP_RTK_AMP_DUAL_SPK),
-- 
2.54.0

