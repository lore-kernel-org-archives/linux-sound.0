Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0203D9540
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872913; cv=none; b=Qd971tHaHKNvVktPKodjRje72MY2cgrHzCUstRV+2YGGWd0IO0VKGBt9OAGbjCTAWwe6dhmiFjaFslhD+AIC9EaDysE5ZuFsD0HpfZcsLmvYF86i6usf6Z3MHGC/vw2yRBjpMZh/scv3VW1nNFsaphEh5CQbOz48xqucmVuB0k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872913; c=relaxed/simple;
	bh=/kD8Dn+Vjj/4MegsD4HTU4Nit4nbFX6TZSxPnGiAjgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byMl0JuInCKJbls+Atn9FKm0ce03tL01seJCCzZYTTrBcL6CfPSE3oY925U9x/xoFYxjtWhrfSZVpeCa5/5zYBuOQEF5BvsbimXYMspXk7n8nWXRMgej4KC34DbIVKQU7ujjIOblo2Q33MqSPg8BwUTCylDNGTEeV9IIn0KyFgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=howMAKdC; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="howMAKdC"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4ab70b882c5so481987b6e.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872911; x=1788477711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opegbFI85ijkW61XNldND7ey1Wsmf3PxBxL8sOVvLZc=;
        b=howMAKdC7LAwFWHdAPF5hRUagsznDnow/xQMMBBQ3h96qs62FUaNSVs5BqQwaNwyKY
         dAEQ8lnYI2CpBpBQ/WvFb4V0D1n3Ae3jOsiEBSwZa7Yq0uldLZNLB9dv4q5KFGQz96km
         JgGyO/yvwZBOsjC1C0H80LwCK58/0KZ5IIPoK7u1ugw0lVs6gD637la8spnQbWnzTpoK
         54uqwQYsO7bUq0UrJKp5RUwi+2yL71u18Qp5HPGJQ33dHhz8sDJPtNpQIs4lWz9qeGuw
         wp1KNjtFb3a6VcESWgt8/qlOul9heOlMRmr2FuezA9Ov/zhUUMG15k4AXU3hNXcGzuiX
         Gtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872911; x=1788477711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opegbFI85ijkW61XNldND7ey1Wsmf3PxBxL8sOVvLZc=;
        b=I0TMNIK24IVscY8byG91Nn6rjtNzKZEiyeEaTwcruzUaD6m3wzAYBeQu8LX7xkYLCm
         oz7FnrIpB0EbV5WyYJtb/96vqYWwmuA82J94Vum5QUuBDSoLGTATY2cprQa5kIY2EOaL
         qVQj3XAbHdj52TPQU+0H2YDNZwBxkNiUqGT3H42DfDn7fw95geREF1IFRPcLCiUjCkYA
         lZc8ujl6kMJP3yIVQf+CwTAa51GxJIqXNyQ/lMFSU4nMH2T0JPSUc527L+2FpSGGQXD1
         dHvUrTRFQgZ71xYK3oRearapyXAYV7MtA5C/acqfp3hI7zjb4DW+GHNTJcRuX3ppOit0
         n2kA==
X-Forwarded-Encrypted: i=1; AHgh+Roc6S1wx3Vrup6K3NzOA41ZtipxD86VmTgF1KTaTAM8gr8kmO00UnJU0fLItw+7/MnoJ80T/pF9h7eEAg==@vger.kernel.org
X-Gm-Message-State: AFuF++nWAX4FjWQ5ABFqY4kkUgeBnY7+AduKlxw5CRQg+Nt4y16NvnMa
	ueAl7MKRxltnm29m4unK12SaCPn9nFCD5pYoOCw5U1hXLJUgxw8zmWHg
X-Gm-Gg: AR+sD13QlLMlYSJoN21IRV6KnHQgJ2jGAv+EblqIPP+KI1m5mGGAvAqxiy8UQ1t3wss
	srKTi69UMaEg/TBZZFL1P/RrnPMYK8jCrDEMZ2dyjoMw3pHBMfG0ZMd/QEqWeqyVbybN0AWuieH
	281CZcu3uDyAZ4b6sSn7hqrh1nnDctJyGf6CwHHKYSo8QManhINTCFQ4g5JAq8IfV/0r0TMMHQO
	L/8/ms5Jt/MM7IkM+nvs5EK44NXxvuIvfUJa9bRttjo2C+uhxy8Muce/ZaRu+sqoZZ0SwAKALD8
	NvNRXdEPuBv9Fz0B9dO/k02zucCW7ax8q1eV5846SvVHIdVpGHDqPtlihs5ccnO0is7j1Quet3C
	9nuEmsrhDo2wywPqvnG5HWEj3B0kGcDa1o1+K9svGTqLIJEoCku8moY4/KFpXmMLH6eFLMLgNIm
	pMcgN+zjQWxMkZv8gJjpTAExxesDvIn+dWILxTx5fX5eLiTe5UQISGNTqXYcucKJinifO1d+cCk
	wr2cg==
X-Received: by 2002:a05:6808:c3ee:b0:4a3:3108:866a with SMTP id 5614622812f47-4b3982eaaefmr3092039b6e.17.1787872911304;
        Thu, 27 Aug 2026 16:21:51 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:49 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 1/6] ALSA: usb-audio: Add PM guard to Studio 1810c controls
Date: Thu, 27 Aug 2026 18:21:38 -0500
Message-ID: <20260827232143.149197-2-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Studio 1810c control callbacks issue vendor transfers without
preventing runtime suspend or disconnect. A transfer attempted after
runtime suspend can fail because the USB device cannot accept
submissions.

Take snd_usb_lock before the driver data and USB mutexes in both
callbacks. This resumes the device before either the state read or
control write. It also prevents disconnect cleanup from racing the
complete operation.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_s1810c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 2e5a8d37ec57..bdb5e3aaff3b 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -474,6 +474,10 @@ snd_s1810c_switch_get(struct snd_kcontrol *kctl,
 	u32 state = 0;
 	int ret;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	guard(mutex)(&private->data_mutex);
 	ret = snd_s1810c_get_switch_state(mixer, kctl, &state);
 	if (ret < 0)
@@ -504,6 +508,10 @@ snd_s1810c_switch_set(struct snd_kcontrol *kctl,
 	u32 newval = 0;
 	int ret = 0;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	guard(mutex)(&private->data_mutex);
 	ret = snd_s1810c_get_switch_state(mixer, kctl, &curval);
 	if (ret < 0)
-- 
2.47.3

