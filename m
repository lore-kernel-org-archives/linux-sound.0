Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659754;
	b=U1HgW0s7PoT5dR4H53R/r0g7yoaCnL0d1yayVHfRlmZN5H+3FzklQklhm5GYtY8jEofW
	 YiGjA0whnpfoq5EqlBuoEel+Ly99v3n6ixevSaEG24gz2X/I5c9Klwru4bJIdGdl7qKc8
	 gI1aejiuBGy3QBWBL3TMmBo3QC+4UHVav8JjoMtVZJCP6mrWVpcvmDao+ei0nbbdFusqC
	 qxSqqeJ7Bby+t5loPTqktGi1bzDSCxBlxBXNMNZRHQ4fpxAbFeA42+KYQW1SZNQ39fWWp
	 A0BvC+rfspC5TaKvRz62Zvh2kdm3rRZ4Bsi1sIvs6awDj5euHRYBHALBqJi66J8RfMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=w8Ut6VV5Di6CNE8vyqw+0jM+spNugKV26x4DckuAv0M=;
	b=n5YvyzVY1pZGWHXzpS195WsDRtuF8TA7B0LTDat5bifm4vOOGBtcrmzeYczDl95LiCOs
	 I5hx9kzJhIMmHhKwGf1Q+rhgjoTQHgMPZ5ez5BVlM+ah+BYi9Wy68Z94vLfAreCw4Uhra
	 gLcBgimXewhfrtcRc57Fzi6RhCKATnHogTiHbHk5MqB512iGCwALSkixxY49cKEO0M/Tp
	 Mmokq/YTRWsCnq19y9nH9fVA6Syi01ms1gubWQeXGQrTiLcOBGjgwSyF3P/N2G0CnUyF+
	 uLsC1gi0aXBLv2c3Q5bY3IytgEZ4g6labsycWL9r4G9tdC7pmM69nKExjJ0owe6gpOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mNB2lHYj;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4331606A31B
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4331606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mNB2lHYj
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c411e139259so126556566b.2
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659752; x=1793264552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8Ut6VV5Di6CNE8vyqw+0jM+spNugKV26x4DckuAv0M=;
        b=mNB2lHYjSdbnQVFPtxbXq+3FlkpqI6Lw0NcsTUMIeU7sccwnr4o6zr9IuBR0U+8ieR
         uUIvrZXLr4gw8w1IuvCYeIPopiDac33l3/U0FTvT8XexCHSH399CxHi7gUDxK3Y+nV9K
         f/wC/ovoWeKscUfkYmZn7HkDty1ZjaSMXpIxExuMdBOLrt9AQoBWLxmUU/O+H9OjfW+4
         m8K5R8K9kRlmTplWlPjJ+qEyx4vNMrenCmgVgG6QyKEBOVXF2ulpvZolvjE7NaV3q6Xo
         b3RT0ZKq6iswc/nP9SyJXjEiUtXxq4j+FwKRyj13Lm2ixfswz4UfPIqGriCAasuVSO81
         F2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659752; x=1793264552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8Ut6VV5Di6CNE8vyqw+0jM+spNugKV26x4DckuAv0M=;
        b=WFNf4DOzWj8Vpczxv7e/LB6cArhiG3slAnO0qrG8hhP0TceQDCT40ajhmEubQtXYID
         ayO7UQqkmPL8jA8xYo/SQ/AUcbCFk5IZmnJgQFdbVy0chSqggV3g7Up2Xd0BHh+2bn+b
         B5tTf7JAIrMKIdZgzRHQHFfI+BuRMKMdrBuSaIVv/BdPtOMgLrpKvsuCTvN8AZSsQTl7
         MXwMAB4utFeQwp4oOAAr+qfqBaM9lpyworKfwfIp1AikjpPVubfwp2ZRRoHZRPzfBA/z
         WJnIALbRqXgmQlhEdAGY/6XAEr8pUcuUbAJmZf/SlJJaUAZ1An9XlrX4wd/uFQ7kf1f3
         Iezw==
X-Gm-Message-State: AFq9FYLT3elA3EWQcdHF4G42yOHDgymeEqSgBEnJzqjKSvCphf1KH02P
	H3CQSkrywEGch2dlECAaQVv0FEzvJ2ezorOGmCWD3s3q9zsn7DBFkcMdYMMBctvNoqI=
X-Gm-Gg: AYBFou3DvEWCGf5uKWNlfqjMYjC+lScTa7/Jfu11tQzJtMZpTR/M3BD2Cj3b/kVNH0V
	1J3HmShDx+rxHSq+mMLi35uIvo97ba8fk61XsnqJ2kawABs5DSwKke5N/dR75JTC8AY/LGpGxf2
	87Gjcg9GQVNeYuzdD3RzAr6WU4Ng7NjRHi6dcgIcRR2R0Kf/LJo25R4KBDV5sSStvusjST2NuzQ
	AGyQsJ93i24wv/h9f1QbUvXJtstctbt/T3bD8hMfigZGnMDvh2k0zFxSBSBIl74Yuh3Sx/us+VS
	5+TEhEoj/bsbflSy/kVFPDtbEzJx2Tbd8J3AdDcs68tP5dIBrbNqkyegwxRijuN7qFMO1zRQCTc
	JWXlpAnxejpNMAvfA3NvjOVi0vhxMnRG3LAruf9O14zWfFa8fU8jo5OWOiDRAdAB3WF0UdfZ1WC
	3guzcQqZYZgu4vjFNOPdN2f7oN6Y5394MoJactKJclGIrBvBmxSCKZv1sfxPisuzvUS0DHsvyMd
	wI5xIgljiNCGcrYjcG4wouEEl5mZtJ5mz0Vd99e6VrE6hhTx8d0mEJovYI9
X-Received: by 2002:a17:907:6e8c:b0:c31:be58:5dde with SMTP id a640c23a62f3a-c4679780524mr436408966b.40.1792659751905;
        Thu, 22 Oct 2026 02:02:31 -0700 (PDT)
Received: from FBox.router.cpe ([31.40.4.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm11027435f8f.32.2026.10.22.02.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:02:31 -0700 (PDT)
From: Shahab Ghodsi <shahab16774@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	kailang@realtek.com,
	Shahab Ghodsi <shahab16774@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ExpertBook B3402FVA
Date: Thu, 22 Oct 2026 12:31:49 +0330
Message-ID: <20261022090149.304576-1-shahab16774@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ExpertBook B3402FVA (PCI SSID 1043:1e03) uses an ALC256
codec. Headphone output is extremely quiet and distorted, with only
the loudest parts audible. The BIOS does not enable the headphone
depop circuit.

Reuse ALC256_FIXUP_ASUS_HPE, which sets COEF 0x0f to 0x7778 to
enable the headphone depop circuit. This fixup is already used for
the ASUS TM420 and B1400CEPE.

The COEF write was verified manually with hda-verb on this machine;
headphones become loud and clear. The chained pin change on 0x19 was
also applied manually; the headset microphone worked before and after,
and audio playback was unaffected.

Closes: https://github.com/thesofproject/linux/issues/5996
Signed-off-by: Shahab Ghodsi <shahab16774@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf9..e746b82 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7917,6 +7917,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1df3, "ASUS UM5606WA", ALC294_FIXUP_BASS_SPEAKER_15),
 	SND_PCI_QUIRK(0x1043, 0x1264, "ASUS UM5606KA", ALC294_FIXUP_BASS_SPEAKER_15),
 	SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402ZA", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1e03, "ASUS ExpertBook B3402FVA", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1e10, "ASUS VivoBook X507UAR", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1e3e, "ASUS VivoBook M515DA/X515DAP", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
-- 
2.56.0

