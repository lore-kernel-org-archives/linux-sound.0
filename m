Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C54367B66
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780436491; cv=none; b=gWCdijiq6G4zamr2Mkwr+tqKCABzu3q8b5Ul6ApNj7YmTiJ5RGyVE4FIJsnbr63TVTdgvX1nv2deUFQ+4zwE+3nUId/kvDXXWXg0DI/CQ/XMMOSNW15mnbyGDdykqf9n4s0CHEM+R1nA5ccNrlsJwNluxP7SBuf9JCt1CoQ2B1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780436491; c=relaxed/simple;
	bh=sjMsbbjjMfo9G1oEK3UaccO9b84Vt9uv0KKIhK5TKS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmZg5lEnvEURFjriM6YRgY4VjukV7En8zcHqxxGiW9Ak+cm7PnRDlbFO1B/AJ6d84fGjDMqtTCqW+2POxtRBcO6v93j5QvtyxRhtFkHhI2hA6XoNCoxwCGJC7rvVMvxV93nNOHpDR7ncuHQl3WuqM/j2T6ea9WR1yyXs7o1O4jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxEGm46G; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxEGm46G"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5176b9c476aso9195911cf.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780436489; x=1781041289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1Smy8/SB/PveJYFtngxRxdzvHxPRcQ4uBdTyESwI7A=;
        b=lxEGm46G6XukysB59GNrk27i9w1QhhQkP6GhjElIU8XSiaHH47njn3m9crLa7SwGTT
         YEar+gOZoFOnS8qsQdUQYgjpdz3UA7LjAu3Wum4qF/MIGb645lOVE42srsQprH10Ltlo
         MHMKlwnUynuctwZJAbVWgSrRK2pWhvoqtQrRHPXUwaLg+TyUp1kPvJZqytJPWYyLVUH3
         apuwit4aj6Iu06JComnHN+a7mn2gMuj1K4/tCuxpBz6SNhBVYpfAmELzx0nPpDZVMijI
         45avmJUVTN4U7IV0f6ponvfTeDAPCPWBDfX+UrKiaT6iUI8IVIGaRcMhceNeaLKZwIQ/
         q14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780436489; x=1781041289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1Smy8/SB/PveJYFtngxRxdzvHxPRcQ4uBdTyESwI7A=;
        b=HtlgM+AS2LwECj9lv5RZfvoJyGR798IWGjZJmsdq39XDpVCBB9qLc6snvh2IlyNAxf
         TDREwPQJnNTEOFJH2JR/xbe/fjk6VItEiasBfkZCivBQ8YFCWk8YVt/6tcGzZrtkjAWd
         B8uzkdVhEAfm7Ptd8OB5tLuzl3Q3unFlyDtCSg/IA71KJ7gmZjOjs1JZXnpsUpDlV9f1
         UGwFuGTnWv8SzAMLdlA+TRGEM9PyeEc8VaJHCgyYpOtGRLdi6t+Wm0Y+meRnqHfvL2zH
         Sa5HwJcLCItaxqU1UtdVWCVu9G4PXaepbmOpdFWmHU1kqnrfxZdwCHzs8aDda56MN8T6
         cLVw==
X-Gm-Message-State: AOJu0YyQKdvjy/unvi+LUc9kyKp1w9fFY6xPWNcVIEtflFCsuTwhTNMD
	TK+/slbqqLsC7xq793BWXcfGqWabalQ+Krs4F5kEHbNh5R2z6gM5NcGE/6SSQ56pfWM=
X-Gm-Gg: Acq92OF/8SDw6Mr9LUmE4hDUe/BoYSY1bAEkR+6pH8muscPCZX28reS6w5EumVDAChd
	mZHi7P3AjLu6fgmC2FF1LtlTEKjXttMzs4uf/Ngt3p57qU2JeUD/RP8Si4rX/tB4arQ7eLdl5p9
	WMWu0e4ZOI8kZ5Ha617dwtVLPlvrg0+qdL4CeM/ZLGsKKcBuIlfXzq5g8OO+A3a1j9c5fkRcPyi
	d57H34uhk73M7CpM7+63nkZ2RzhoL8FNXRoQc3rO1aIuotxJMq1bLtqC/fIiNFvG8u0iTgJ9NqM
	PSKzVYGCwtECtM1PGHMs/0bB8Lz0dw6odM64VLysxiWLY2KfU6kOK6UZ+5DPw+0xOwbI0vc2ca8
	vfA2mjbwvRCha60HTVWbYyOgM+Xmw2ghMMt1LcgDouylKCffqPqVbQ3ovrVpVOCKdlzL84xOTYU
	gGwE94h9BiZXh5g+GnTT9V8dPcYELjbBQnAeOfnlKKm7sR8BzcCIWwUVaOlmE+BdMpJg==
X-Received: by 2002:a05:622a:1391:b0:517:6ef7:f6e0 with SMTP id d75a77b69052e-51778753f7fmr14366631cf.46.1780436488652;
        Tue, 02 Jun 2026 14:41:28 -0700 (PDT)
Received: from NixHeater ([194.59.251.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5177b1c1c6fsm342911cf.18.2026.06.02.14.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 14:41:28 -0700 (PDT)
From: Evelyn Ali <evelynali99@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Evelyn Ali <evelynali99@gmail.com>
Subject: [v2] ALSA: hda/realtek: ALC882: Fixup for Clevo P775TM1
Date: Tue,  2 Jun 2026 17:41:22 -0400
Message-ID: <20260602214122.78020-1-evelynali99@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clevo P775TM1 laptops come with an ESS Sabre HiFi DAC. Setting
0x1b pin VREF to 80% enables said DAC output.

Signed-off-by: Evelyn Ali <evelynali99@gmail.com>
---
Notes: Since 0x1b seems only to enable the external headphone amp,
the non-VREF bit preservation of v1 seemed extraneous.

Changes in v2:
	- Move fixup from HDA_FIXUP_ACT_INIT to HDA_FIXUP_ACT_PRE_PROBE.
	- Drop pin-target read/modify/write logic.

 sound/hda/codecs/realtek/alc882.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/realtek/alc882.c
index 529fecd5baa0a..fd466b6985f05 100644
--- a/sound/hda/codecs/realtek/alc882.c
+++ b/sound/hda/codecs/realtek/alc882.c
@@ -61,6 +61,7 @@ enum {
 	ALC887_FIXUP_ASUS_HMIC,
 	ALCS1200A_FIXUP_MIC_VREF,
 	ALC888VD_FIXUP_MIC_100VREF,
+	ALC898_FIXUP_CLEVO_P775TM1,
 };
 
 static void alc889_fixup_coef(struct hda_codec *codec,
@@ -236,6 +237,19 @@ static void alc1220_fixup_clevo_pb51ed(struct hda_codec *codec,
 	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
 }
 
+/* On Clevo P775TM1, VREF of pin 0x1b enables the external headphone amp */
+static void alc898_fixup_clevo_p775tm1(struct hda_codec *codec,
+				       const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action != HDA_FIXUP_ACT_PRE_PROBE)
+		return;
+
+	snd_hda_set_pin_ctl_cache(codec, 0x1b, PIN_VREF80);
+	spec->gen.keep_vref_in_automute = 1;
+}
+
 static void alc887_asus_hp_automute_hook(struct hda_codec *codec,
 					 struct hda_jack_callback *jack)
 {
@@ -560,6 +574,12 @@ static const struct hda_fixup alc882_fixups[] = {
 			{}
 		}
 	},
+	[ALC898_FIXUP_CLEVO_P775TM1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc898_fixup_clevo_p775tm1,
+		.chained = true,
+		.chain_id = ALC882_FIXUP_EAPD,
+	},
 };
 
 static const struct hda_quirk alc882_fixup_tbl[] = {
@@ -664,6 +684,7 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x67f1, "Clevo PC70H[PRS]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67f5, "Clevo PD70PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x70d1, "Clevo PC70[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x7709, "Clevo P775TM1", ALC898_FIXUP_CLEVO_P775TM1),
 	SND_PCI_QUIRK(0x1558, 0x7714, "Clevo X170SM", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x7715, "Clevo X170KM-G", ALC1220_FIXUP_CLEVO_PB51ED),
 	SND_PCI_QUIRK(0x1558, 0x9501, "Clevo P950HR", ALC1220_FIXUP_CLEVO_P950),
@@ -719,6 +740,7 @@ static const struct hda_model_fixup alc882_fixup_models[] = {
 	{.id = ALC1220_FIXUP_GB_DUAL_CODECS, .name = "dual-codecs"},
 	{.id = ALC1220_FIXUP_GB_X570, .name = "gb-x570"},
 	{.id = ALC1220_FIXUP_CLEVO_P950, .name = "clevo-p950"},
+	{.id = ALC898_FIXUP_CLEVO_P775TM1, .name = "clevo-p775tm1"},
 	{}
 };
 
-- 
2.54.0

