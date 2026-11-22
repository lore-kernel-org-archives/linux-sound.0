Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384741;
	b=LsnQcVDtnKq+4XekjKQ2lvhErVxBmT8+d3AN8kg8iSCE5Lvivmz1hFL1cj7TIJxDaYgr
	 tW9dPMKCv4uvZWo9EFYORa7LEi8O2L16K2TFPKqMqewuHJcmvKYsT/IUml80rBHoz6NcG
	 dzUhKEOUNxgG/YKQDOf2cEkbvFmIB5WI4eVC1hrOu+axQLeTCF811LlrbUFYn8rDsR6Fs
	 +zjS6hepA3lASn85kQYd2BPwrHzNgKcMc/SgzxZBliV60FLdNqVF7gsVva6L/srma+WxH
	 dxZ9o40KSfV1whAP5m4hBNc2a50Dfq9gP0mI6nP3ah2iYGmNoc87NP+DLw277IOIvPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pw/voVmj5uftUbccaw2UZFaP55y1rLkAcdEjsN7VXlw=;
	b=ywy62/EsdiQGPUnoXCbtMICLqHf3cABiEwKcNgQev2gl4VrsdgKPIxYd4OZ10kWI2Kj6
	 W3I+jt79ePNuDs3+sIeRdMSolyeDYZ8w+22lv4gsmnKlYHaVOTZsEVtEfiCJsxqRiBw0C
	 UK+JsnMjn1+3MGWpyBnoj0pcQMrHtg48EAbzndN4ZK0G5YTgM/IDd3skuduIQya0U3BFp
	 Nqddd6XSTcbHssOjKzXPiRor7XgqUkpIbY7WYXqNQFretF9g1zE3JvACYtBGexllb2/1a
	 8ZvdXtUsfJmno+CAXwzfA3BpC+9yn4fZJI8b9VSSh/eBdzmlGjLJacT9VtZQEYd/adw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1aDdf5W;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE7606A31A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 21:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FE7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1aDdf5W
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso25906485e9.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 13:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795384740; x=1795989540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw/voVmj5uftUbccaw2UZFaP55y1rLkAcdEjsN7VXlw=;
        b=I1aDdf5W7q+WLCiHZq7kYuW12XtEDhvS358e9FtNkD3ETxNkrj7KH2cR6y9RLjrylv
         dIPsQYKOdRBgOUdCwrk9fqrVbjv8fmQRE8rpz5Furcy0KYs6WAHwjyBm3oXYCzFXseK1
         cqBPLsXNzpFGF8behHVTQSDGuF9pkhWjxBG8aJq4WYfD9uU/PPWpskrVkw7U7IOHTGhF
         gFfhByyc0R8P2uIBGgHhW5nvorWhThA0U+L9dgXKWlX2fBnJLmP1K8xf0YK6S4/dxSBx
         ZVBtVabs+UbU3QdxJyllyDlNkBw3yG93l4864iurpgT109whLZo1tM7WasEm2BTTDgaz
         9zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795384740; x=1795989540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw/voVmj5uftUbccaw2UZFaP55y1rLkAcdEjsN7VXlw=;
        b=DXPcPyAQB6AHecEETOiJNCqfMgF3766w6Zn9+Rm+HBUwmmD4oImxbA5PXm57u8yzbW
         jR3GSclmuhqyMuIpID1ZX6pzEJW3YjmVYJ3LhtZiZ4yL8U+H4WXQDYKEsLKogcmN3jiq
         a8ft7O/MMZ3W+UUw4Mf33C/t41CDotyOYZnmS43h3YJ73d7A7a3ixwE7aCq/YbllTiQ6
         izqaTNN0saOykruHS/MEwMVwvcNrLvfxYkfJLkHnr0nB19hm0w/V8muG9n3aeISqWwE5
         QsM7M0B7z2+AoijX+pSDk3RAm9BSDvv2wI3V5/PTJpxzvI1xnzgQPVaZnqI5fo+AvvM2
         xpuA==
X-Gm-Message-State: APuU4Z8hXUyXmcM4fMexbS14nycwhOp7cv1ODJujJlirFl21nn0/84af
	ngznjo7nP6/imGBAKW74DAPc94Rk6BOyfbwMMiDEwwuQhQFFELrjKVpRyhtGFUptUmU=
X-Gm-Gg: AZFdTZdSs2CO5DKKuRpT191EwUDsomeRs7/vW6s5bBe/sEjvxjbUZ3hgJ2Sw+XXOLwR
	FNcQO5a09tiwdvHEL69GApotQdItx1Qoq1H7C8n/T8zNChXWN1A2eqkcmnmpIQVsFyCAyBaD0AF
	6SDbLU/P6mUmFDUGyO+igJhhMcgapG+3PHoCGv+6zX4lntKDtiqinFJGvzHleDsfpVDZNz6BvQA
	Q/poEW6XPF66yswFCUvX7rll4AWz9AJal+eGTMP+bde0tWiOvKsBSOTILLadrSzEpko2Fc94aVm
	fVih61Bab9tWUmxuFkf/ulOJ7dsCVllP5P9sWo/BiMUf8lMLOxqoe2K51lyIub3kMUgdIfOrfve
	g4XrfwGWxLnJYAwm4fE33dsIEYZhYDzVhy2fCC59QMwgzgghs8JJ6hiG+RR4i8I1DmVhPBmUtMB
	L88ZKbp7TdNpwP9v+tC6ESyU6GNp5BC6D2EDp43Uc40wXvov2mJNdTp7eYOrJCDO88vqCRt8+1w
	AGkAva6qzGqGN9V4okwBrtg6pH5X0RTIPsBz8crh0UPT97HwXCA4bZyz0jlziAhaHWNWr7mDqNB
	e3SKAw9tPuMeXS4ETtm5pwzypP0hS3PSmnTfJvtahypgxAOlNi3DBm+3aScfVEVoDZbpNpRA+5F
	sCL4QC/gsjb2V5qoPReAwEzED0gyQlLIIzo3+w7LgUUPaYmARiQ7lDomk
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr200557535e9.16.1795384739519;
        Sun, 22 Nov 2026 13:58:59 -0800 (PST)
Received: from telekom.ip (20014C4E24AF4C0067F24712333371AC.dsl.pool.telekom.hu. [2001:4c4e:24af:4c00:67f2:4712:3333:71ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm301867015e9.2.2026.11.22.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:58:59 -0800 (PST)
From: Martin Szathmari <martin.szathmari@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix speaker on ASUS ExpertBook B7402FEA after Windows
Date: Sun, 22 Nov 2026 22:58:57 +0100
Message-ID: <20261122215857.4580-1-martin.szathmari@gmail.com>
X-Mailer: git-send-email 2.56.1
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

On the ASUS ExpertBook B7402FEA (ALC294, SSID 1043:1b02), the internal
speaker is silent after a warm reboot from Windows. The Windows driver
leaves two vendor coefficients in a state that the generic init path
does not reset:

  - COEF 0x66 bit 4 is set, which mutes the speaker.
  - COEF 0x1b bit 10 is clear, which distorts the output once the
    speaker is unmuted. This is the same bit ALC294_FIXUP_ASUS_COEF_1B
    sets for the UX431DA.

A cold boot clears both. Comparing all 256 coefficients of node 0x20
after a cold boot and after a reboot from Windows showed five
differences; writing them back one at a time showed only these two
matter.

Add a fixup that clears COEF 0x66 bit 4 and sets COEF 0x1b bit 10 at
init, so they are also restored on resume. ALC294_FIXUP_ASUS_COEF_1B is
not reused because it chains to the GA401 pin fixup, which does not
apply to this machine.

Tested on a B7402FEA (BIOS 308): sound is clean after a reboot from
Windows, and after suspend/resume with both bits forced back to the
Windows values first.

Signed-off-by: Martin Szathmari <martin.szathmari@gmail.com>
---
Based on sound.git for-next.

Note: This patch was developed with the help of an AI coding assistant
(Claude Opus 5.5). I reviewed the change and tested it myself on my
ASUS ExpertBook B7402FEA as described above.

 sound/hda/codecs/realtek/alc269.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a6b5e8987..cdda02054 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1116,6 +1116,21 @@ static void alc269vb_fixup_aspire_e1_coef(struct hda_codec *codec,
 		alc_update_coef_idx(codec, 0x0d, 0x6000, 0x6000);
 }
 
+/*
+ * After a warm reboot from Windows, bit 4 of COEF 0x66 is left set, which
+ * mutes the internal speaker, and bit 10 of COEF 0x1b is left clear, which
+ * distorts the output. Restore both at init and resume.
+ */
+static void alc294_fixup_asus_spk_coefs(struct hda_codec *codec,
+					const struct hda_fixup *fix,
+					int action)
+{
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+	alc_update_coef_idx(codec, 0x66, 1 << 4, 0);
+	alc_update_coef_idx(codec, 0x1b, 0, 1 << 10);
+}
+
 static void alc269_fixup_pcm_44k(struct hda_codec *codec,
 				 const struct hda_fixup *fix, int action)
 {
@@ -4372,6 +4387,7 @@ enum {
 	ALC294_FIXUP_ASUS_ALLY_VERBS,
 	ALC294_FIXUP_ASUS_HPE,
 	ALC294_FIXUP_ASUS_COEF_1B,
+	ALC294_FIXUP_ASUS_SPK_COEFS,
 	ALC294_FIXUP_ASUS_GX502_HP,
 	ALC294_FIXUP_ASUS_GX502_PINS,
 	ALC294_FIXUP_ASUS_GX502_VERBS,
@@ -6249,6 +6265,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC289_FIXUP_ASUS_GA401,
 	},
+	[ALC294_FIXUP_ASUS_SPK_COEFS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc294_fixup_asus_spk_coefs,
+	},
 	[ALC285_FIXUP_HP_GPIO_LED] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_hp_gpio_led,
@@ -8207,6 +8227,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1a8e, "ASUS G712LWS", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1b02, "ASUS ExpertBook B7402FEA", ALC294_FIXUP_ASUS_SPK_COEFS),
 	SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
 	SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1b93, "ASUS G614JVR/JIR", ALC245_FIXUP_CS35L41_SPI_2),
-- 
2.56.1

