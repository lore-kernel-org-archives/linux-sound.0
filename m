Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE33A4F2F
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785564424; cv=none; b=GQD9+IsaLrS7iKG6ks6PJpXr2wDVbZ/jgTyGE5oa30zI8XNYFPVhj+y59e6VuQOBfMmz7DrQ96LtTv4zJLLexgbDC1oYgia3jNQI/HT2h4m07VM2YhIz2sD8rUAOmgKj9DxlkcheCtA3CEVQoN5BhKII4E4sCuKXeae5yHV7w9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785564424; c=relaxed/simple;
	bh=KWCJg2shpHVnd+RXJJK6A7rreypMIyPtZFkYl94nyS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWHFiERLdJiimrQMEPHHJaC/Lf/O6nujq4lMhcjs+6eCNUC8c7lxfflvXB6witZEX63JGv0t7ootaClB9Ke/H2W8PSswDXSk4CzdxBupDntAA8V/c2c8UmXr1AetkvhMgPqT2MYbZvjlXHnPDjpoWdinqJnPs7Wq6YzbFXN5KGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2bVUezp; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2bVUezp"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6ae3faeb9c3so461986eaf.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 23:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785564422; x=1786169222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwWDtPM/2EQol4Tw736CLyLPuritvrIahJH8QRTL3es=;
        b=f2bVUezpMc2XBoF8g4dJwWfN1q263q3iLskOUW5wOYd/cDbzC+Egxo8QZ7DNaGUTvi
         x49GTGzfX8ok5vuEzecZf9u5t6ZC65gkeF9LVvTOCGdgyYliwzkullp0QKFGTX2byYM3
         oTe4iuOHH8+4QoSPmDqNCypkLX2dIRWygpKVt7+gKpEubn1tpnhmQf8SitJzbxFEs9DD
         nrKTP43wYjLA4B9wbBVa/v3BVX8jEKREcD20TRRbBR7+spmKVFDm5feOKealkAqTdv4x
         cXA9TWiNT5Y3JDXcckD2fIixGn0cLfV9D8UXdekf8YnUWRKR1rh6jmhlL5vzAWMQn8E3
         5CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785564422; x=1786169222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwWDtPM/2EQol4Tw736CLyLPuritvrIahJH8QRTL3es=;
        b=gEAppKJduZ/8Uvhne1qLwMaQ2Vb9jSNlbl13/I8LzlsB5jV4r3AfaUxe3z5Q+Ew7sy
         /zsMBU1DK/6/nW4fu7lkDatsZ0Az151Owqyl76kwV7vMhYNpWeRlYXfYffFfB47oIypT
         OtmcWeYdDZVBjMiDkUNuh42AAKuRwpqkQYpCxT1lG5gV5DmEI8xjuq03tbJyJmuai+ce
         Auo64T5MMTEVmXxlRbo8lExTHEE96JUBgfzhc9Q/9Wvzt4EbwHW49h7EsYd+ftSZ+FdO
         UGSyMAwTcN5w8auty22dl0AZu+RWPovFGyL8PWyVclqcMA/Zx9I71Mr238AzsUgAzHi2
         PJsw==
X-Forwarded-Encrypted: i=1; AHgh+RoQEIfOMsyaxmwgGM9SafEibzFDu7UNwZdghWaYbymxoKKlCjdS3jWaIJUU1Hw5MZ58PQA/wwaZpRYtcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7hVC3CyJqhD4HeR+Y23VIfAGW1GUvQqJFhsM/bQWQKm8tg1Ps
	uvdItE6SQEoUTQSADmxRFiXp283uGuxzdAaxm0liGVi+gxBQEtZSvZYm
X-Gm-Gg: AR+sD13QPhLakraGTOUfU/JS70d1b8/zfuJPZ5BU339r7tNxDGixJmIt8PFvLFpMhWt
	drehOhc+nDwNwgKwqP9hRu4M2BCU9qmMbbcT3MgnZNKVsaXI1PdvmeuksD1wpHaEuhUKz68tOZW
	FTtrZtEBtyNNwtGY+6NXeWYn08s4glIWtcUNOy+8JWU3nBPd4b30Te29nILl3RfdgcoNQyHcIuA
	zrH34vvfZWw2cwNkbNr7ipl+CIFKtz0taV7y/SLj4PhX6EraYmECjaoBjEr3a4cwpPSUwCo/UZ1
	nQbCoN+wfJELJp4ifgA04wRVLGwsJCkoqOkUtfK9dF52tFEOqseD9C5C1MlxYpdfZH/l+Z2G0s/
	hemQ24DWtjpTXIthQ/Q+KTXGTs78yYIvPZ/cg/xyn1tzqlOmhYvG/qzd3aUd/XcoFImPTI4YkEz
	0ZkZ75CaGUXfP2hm0bo0F7mqLnU2sXiaZb/cjQOBZC5JuL9RAzi9O7RFyRdg7BWxs74OOE/xUHu
	b1puQ==
X-Received: by 2002:a05:6820:3090:b0:6aa:fbb4:808f with SMTP id 006d021491bc7-6ae4328f561mr5236022eaf.12.1785564421994;
        Fri, 31 Jul 2026 23:07:01 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f664d812sm3473404fac.9.2026.07.31.23.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:07:01 -0700 (PDT)
From: Aaron Ma <mapengyu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Aaron Ma <mapengyu@gmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	marco_giunta@outlook.it
Subject: [PATCH 2/3] ALSA: hda/realtek: Use quad channel map for Legion AW88399 speakers
Date: Sat,  1 Aug 2026 14:06:29 +0800
Message-ID: <20260801060630.2768318-2-mapengyu@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801060630.2768318-1-mapengyu@gmail.com>
References: <20260801060630.2768318-1-mapengyu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Legion machines pairing an ALC287 codec with two AW88399
smart amplifiers have four speaker channels. The second pair is
full-range rear, not an LFE channel, so the default mapping is wrong.

Advertise FL/FR/RL/RR quad channel maps on the playback stream so
4-channel streams are routed correctly.

Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2e3f7f1b52782..42fcdfe54225a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3268,6 +3268,15 @@ static void find_cirrus_companion_amps(struct hda_codec *cdc)
 	comp_generic_fixup(cdc, HDA_FIXUP_ACT_PRE_PROBE, bus, acpi_ids[i].hid, match, count);
 }
 
+static const struct snd_pcm_chmap_elem aw88399_pcm_quad_chmaps[] = {
+	{ .channels = 2,
+	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
+	{ .channels = 4,
+	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+		   SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
+	{ }
+};
+
 static void aw88399_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
 	struct alc_spec *spec = cdc->spec;
@@ -3276,6 +3285,10 @@ static void aw88399_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup
 		spec->gen.suppress_auto_mic = 1;
 
 	comp_generic_fixup(cdc, action, "i2c", "AWDZ8399", "-%s:00-aw88399-hda.%d", 2);
+	/* the second speaker pair is full-range rear, not LFE */
+	if (action == HDA_FIXUP_ACT_BUILD)
+		spec->gen.pcm_rec[0]->stream[SNDRV_PCM_STREAM_PLAYBACK].chmap =
+			aw88399_pcm_quad_chmaps;
 }
 
 static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
-- 
2.53.0

