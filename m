Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376820;
	b=3+aJch1jaL7CrsKs4skc0tosOkBgTD8B+AOY6M1LKX8n1SUy+aYs32IWZF6wf5mKEiq1
	 riF3VbDbDxIK05iP2n5ixXvcGEroTQjFq8XsI57YnsuRj4V5TM/nDM8+LTOAH5n5BsRNO
	 99bp7t5V4YV5MKZw5S7FqH83JS0WeBIZ8hj5hl0YqR6TRUixue75+M+NNB82mqZhUzPw4
	 GELB1n66q4jWrCIg3ygGRv97EyBKZ6yXOoMcYa2cUjyTPhB+HZne6udguIQ+JYoc+09Y8
	 j6G2erRy3DqBIQerBIzvhiJGhyJF/0aCpdNNm9kJwmtw/JPrtBgOpfwRWJwxV22yFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cMEdyLvG0WO8h2gcVneXCt4kujyphjxRvduCSlQeHKk=;
	b=NVSx5A0RNy7wJe1stacIPDHq3CK5IjjKnViWlkUBALjKm4JxC+o7oNzRxbUNve+F7a0j
	 ET2FxtE+icqVuq+pNp7TCPXccaJ3Y6hPHl79C49Y6nr2LJrZzBUebTsK8meAVocHZ6klK
	 5/gakxnkOhPFGFbySRF4yWPYO1XOf1utqnFu/cG44c63BstaRoq0oSeuz6AUGCcnpr7LR
	 r7BKH8JmwXWvWKmbXoml5H+DetRvznu82ty3MClqJbED6PJUteQ8Y/IStpF305fdAiKmI
	 rj+/emo+8hSYsMwqeWWmWPBU/u8HqawRVlnzIhPA8qIRxOAhwcsuKvgWmrlYmx3dieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RqzHKapO;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4248C606A338
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 06:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4248C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RqzHKapO
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1485957a12.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 22:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376820; x=1794981620; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cMEdyLvG0WO8h2gcVneXCt4kujyphjxRvduCSlQeHKk=;
        b=RqzHKapO+QtDvs7uHnjoQORw3iYRXoaenL17JZMtLVDsAjHcXvEFGpusWy+QEtwPMW
         HmBoNUJ3pjLygwPvZntvIHPVDyHUfhAET1nltf6Arc5PkSiP3YP+gGLx3WVgXZVlP1Cd
         e//j+uvSWKASN2gI9QWLbq7I4wQsSira6axZlYoI+cVoO3Yja5VQjXeNZdbER/icro17
         PNIAUf8FI/j40le9cczdKAOXmppDUg25pLarFdDvWmkCxzji18DhWbrVEZslgMZ1vu2T
         uztnlixlHwFWb83h1XjmIcAYrP07tUGKERYrsq3tLzCjHtKC1wCRnPN8QrAQa0B/sFUQ
         Maxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376820; x=1794981620;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cMEdyLvG0WO8h2gcVneXCt4kujyphjxRvduCSlQeHKk=;
        b=cgDa2QzWE2lFbGSzhIauhXEWgN88i8lSWVJiUqZMdTDCFBAFSsteJsLdO6a6sA/S2h
         PXmDe2VLU8Sd267yQ2c1/Z2Yh4UJCShgTXHTsjcgTSlZY4U45YEuxu5WL9T9Bbrz7tPF
         LEVpgPHSNn3vZqH1blu6vN2epsWVKa/C6YhxcfTE+SY3hW27omc+PiZpPkvo77/fHWFi
         3ixBQZGfF7WvEDs4TzLJZL1/pMyt/1/mDkECderyFVBOg43deM5CbNoq/ProZbUwWnxl
         pAkrbVTgsYx2Cq/5qAlMu11EVb3ZWyH6hTNLsrMCMaYcGJ3GKM/H+HAB4xP/TgssRrLm
         pC1w==
X-Gm-Message-State: APuU4Z+7kBRISV4xY9cxMbGM2yr/Dn7LbGj44H/EthDejFJMUr2Y2Y9A
	2h+004CcnOOEMr0No3lwEowLnwXaQaoluIL3YWmauqlm+TUF4cYPn7SzrAkRaWti
X-Gm-Gg: AYBFou05Xs1QZInU3P+7up9YuekRajGmsyvel8ZtUX7xIbAw10wcZKNKbB0yero8Cld
	uxNWbVTKfcsvQpzxnhZM2ZrwrHwzPJAS0AQeWSuRjKPZwJVknf5QM0B+H9hkg4KmoyvFN4sfPce
	jnHzAML/yFrkO7RhAoZVSlPfiNquLV3bkad8Zo3LPYLl3la1G61I9Jnn4yIOiGZ7Cc4xe04oXDy
	bStaDRPV/pPY0CJYJUBB/hN3aBPwHs+SrNs/OB+C5n2cFLJDHtoytVdDO8hqDPO35PYsCFIj5wX
	FvnacygwsIJWpCNAa3HUNi8fx0mN9xU9l8WS+rwvjzOjTz138ssuJFvQEL0aMGAq26/JEgYU95e
	xFGXqmlCWBFZK1BYenh5+LnVpX5RmCASJURD/yEjNfVTPqokv75d+EIYMvEHzA5RaS2S88slyJi
	RTG3eVBbvzq2ttliQe1z8YWzpol0d9PikCWnLHZO8NjlwDTATEwn1361KEt0yY5aUaa3dgXbjoz
	H0SIpHcrSOQpDngmOdB+aovv/7k4GKxVA37614vpGZPF9XLRnOnS2aMWJX2ctkJYj1nelxAbK3Z
	XnZIUca/nstIICqypVp72Vb87EHSkQA6EH+iQhmg7h6NT2+x+0wLkQCq1VQdSz5uf/ltTDM2uLh
	FQ0eqJIGUkpE9JIENMrSLmfLvyEU4b9XKT2YLijFYgTFqoWXIBzD7YpNtKjGhHAJwgYIFWPAjqA
	UBUiLYGYUV004/l7NLpgOp
X-Received: by 2002:a17:90b:1a91:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b182f36f48mr1556357a91.64.1794376819334;
        Tue, 10 Nov 2026 22:00:19 -0800 (PST)
Received: from [127.0.1.1] (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db56c7esm2879890a91.8.2026.11.10.22.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:18 -0800 (PST)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Wed, 11 Nov 2026 14:00:14 +0800
Subject: [PATCH] ASoC: max98090: keep the MIC boost across mic input
 power-up
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-max98090-mic-boost-v1-1-20b9bd8816db@gmail.com>
X-B4-Tracking: v=1; b=H4sIAG0E9GoC/x2MywqAIBAAf0X2nKD2IPuV6GC21R7KcCME6d+Tb
 jOHmQyMkZBhEBkiPsQUziK6EuB3d24oaSkORplOa63k4ZLtlS1AXs4h8C1907X1sjpU1kMJr4g
 rpX86Tu/7AQ/Se4NkAAAA
X-Change-ID: 20261110-max98090-mic-boost-c4653dfae09c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerry Wong <jerry.wong@maximintegrated.com>, 
 Ralph Birt <ralph.birt@maximintegrated.com>, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376816; l=3781;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Lc66jw5s26WwD5JavhljQJeyZ6ZUCJVqeJsR1Vj5mjs=;
 b=PL7ALtf+UhJ2CZlWwRE+Etw7x2bjlHjnnnH6v3rWn+FTrA8WgKQwJ+3EOqcPjeD/eH5sW4SLk
 p6BBicb+7z3B1IEwa/O3zQg68j2jSWgzfefTUEa/CmiyZHCe6XC/RUO
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

PA1EN/PA2EN select both the MIC1/MIC2 preamp enable and its gain
(0 = off, 1 = 0 dB, 2 = +20 dB, 3 = +30 dB). "MICn Boost Volume" keeps
the selected gain in max98090->pa1en/pa2en while the input is off, and
max98090_micinput_event() writes it to the field when the "MICn Input"
widget powers up.

The event handler also reads the field back to keep the stored gain in
sync ("Update for volatile"), but it does so on POST_PMU and POST_PMD.
The widget drives PA1EN/PA2EN as a single enable bit, the low bit of
the field, so at both points DAPM has just rewritten it:

  - POST_PMU: DAPM has set the field to 1, so the read-back stores
    0 dB and the handler then restores 0 dB.
  - POST_PMD: DAPM has cleared the low bit, so a +30 dB (3) gain reads
    back as +20 dB (2).

As a result every capture starts at 0 dB: a boost set while the input is
powered down, e.g. restored by alsactl or an audio HAL at boot, never
takes effect, and one changed during capture is lost at the next
power-up.

Read the field back on PRE_PMD instead, while it still holds the active
gain, and only restore the stored gain on POST_PMU.

Tested on i.MX95 with a MAX98090 headset mic on MIC1, running NXP's
6.18.38 vendor kernel (max98090_micinput_event() is the same as in
mainline): with MIC1 Boost Volume set to 2 (+30 dB) before capture,
register 0x10 reads 0x20 (0 dB) during capture without this change and
0x60 (+30 dB) with it, and a boost changed during capture is kept for
the next capture.

Fixes: 685e42154dcf ("ASoC: Replace max98090 Device Driver")
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 sound/soc/codecs/max98090.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index a985853e48eb6fc4b02c8f148f73fb70bf18168b..3ed513f6d81cd6bdc85caea12f38030f85cdda13 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -743,14 +743,6 @@ static int max98090_micinput_event(struct snd_soc_dapm_widget *w,
 	else
 		val = (val & M98090_MIC_PA2EN_MASK) >> M98090_MIC_PA2EN_SHIFT;
 
-	if (val >= 1) {
-		if (w->reg == M98090_REG_MIC1_INPUT_LEVEL) {
-			max98090->pa1en = val - 1; /* Update for volatile */
-		} else {
-			max98090->pa2en = val - 1; /* Update for volatile */
-		}
-	}
-
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		/* If turning on, set to most recently selected volume */
@@ -759,6 +751,14 @@ static int max98090_micinput_event(struct snd_soc_dapm_widget *w,
 		else
 			val = max98090->pa2en + 1;
 		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		if (val >= 1) {
+			if (w->reg == M98090_REG_MIC1_INPUT_LEVEL)
+				max98090->pa1en = val - 1;
+			else
+				max98090->pa2en = val - 1;
+		}
+		return 0;
 	case SND_SOC_DAPM_POST_PMD:
 		/* If turning off, turn off */
 		val = 0;
@@ -1121,11 +1121,13 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 
 	SND_SOC_DAPM_PGA_E("MIC1 Input", M98090_REG_MIC1_INPUT_LEVEL,
 		M98090_MIC_PA1EN_SHIFT, 0, NULL, 0, max98090_micinput_event,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD |
+		SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_PGA_E("MIC2 Input", M98090_REG_MIC2_INPUT_LEVEL,
 		M98090_MIC_PA2EN_SHIFT, 0, NULL, 0, max98090_micinput_event,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD |
+		SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MIXER("LINEA Mixer", SND_SOC_NOPM, 0, 0,
 		&max98090_linea_mixer_controls[0],

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-max98090-mic-boost-c4653dfae09c

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

