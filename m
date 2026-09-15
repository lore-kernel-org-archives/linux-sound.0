Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CE4399354
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461930; cv=none; b=Lx0xmYXsNziRJmTmNh0VgHyRsqapdHK/h5fvtW510vdNiXvDmhwGcvswKh08HBBWFCnOSgLRG9v2N32SQusnNWPiMJrs019KjR2IkA986+YUHi+VtFT1HPX3ldhnhfhnsB5fC1SF111UHq50agqp6z48PgDYuMaGwImOx/BvX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461930; c=relaxed/simple;
	bh=HJA8viQXmqTMPeMmptelZiQTZUoyYiIz7WZjZo4Z65E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gndNhyLZpWhuQDiaocaCo8/MrGykIoiUXVv56vaHuQHss1tI9l9kZIk9g636nyl70zLVWPlX92RbYeZQfO8egZ0iUgeN2uaD7FM3G+vMWonYUFyh19HePX4AZm8xz234gtleRTvy6ov8PCV7YNVsb6yOdmQM0g61opeq+SLWgys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJ8v6utD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJ8v6utD"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so18483a91.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461929; x=1790066729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+0cui5ayAYb0Jrx8Wg8DmgArah2Kx/gm9LNNp3GsRU=;
        b=oJ8v6utDXd+3xTjRBuM7COd45BDFQhr6p3k+CsG/tPILrAovxXqs1Z0OaOSP14M8Pl
         3nsJmq3SUGkLRD3ZCuxkB0t4IXMq+eCQJ8i3HqWDJ0otTW7jMcnJArhPOlELkZBenrOL
         UpfMGViLOOYiGHgWIS+R3JBVvzBQT94LPHGqHN2XdtgeJQH4sIbpn4Hj1OUwgef/vT85
         7KazuiMIMN/ngVDjYC0RuSSWbg1YSW1S8cg/FrI7GBpJU8FkGRbNKxgIyaQJcI0Gq3zu
         u/g4gpfX+AWR/Uf60A/irHNO42ZC6Y3wZIc7nJJ9NpK1GVrPkQxfqX3vRtvtu/bDg2PV
         oNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461929; x=1790066729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+0cui5ayAYb0Jrx8Wg8DmgArah2Kx/gm9LNNp3GsRU=;
        b=Mh6iQdujkZbn5BlgSVKHHIDzamMjUJt/hBa2T0GRW4PufO7/+9wu4Fh770Q61M9zp1
         PP9zjlMcWe9FZv0GCNZMAWiCLNSl6hJAWit4dVLlsebr37jx3IRlcxyA2lYnbVVv3o+0
         +cVCc5t64fgyutDEE2T39bc2FWwCK7my6miZS/9CNMhWr0WsOGThtgnM2wcjASLpGVCW
         Kwuoa8iqKfgzsQZchTC4OCpmZeQJYfGP8irxJBnC2yXzyZj2/m55W0kpo20jJUakYEsb
         xzDZDyYCUod31L7ksV2eg9q9zC7MVB0blnDmYZUcAptzMdjowoKi9qwMv7PXEmof0Mcv
         eCXw==
X-Gm-Message-State: AFuF++ns6wDFM/OqNukqbIubrX6Ls6Jeft+qBNcXsbB2fuVVWvdnMHtI
	enZbsgS7yOPnCNgl0a7eAj7Oh5R2nsxR7BKezd1FJ7/HTjIrIC5MvzBl
X-Gm-Gg: AYBFou091xNn+gUoKEW/PXz8BkLsXr/3rEdx/lvYCPVpLcmUvM12Ts35hvqKEgjB2sK
	5Xjegl5DQOCEM38Qj3QFlNpOXNTw6CivHmPP1sI/RO8Jo8I1hMP5y0Cn3QDJVEhh01KtZwBBFQZ
	zwulW2q24iqNuZyl+gAJ0TCDNtmYNbYXrlf6MV+z0+kx3GlyqW1RiSxN372jPpl8hPlsdIKyAio
	sxVFn7+mHhWEPe+pGsUCK1mSil8FEoW+6RZyzF71FAM+FHsHbKdd5tK+4BWy6XsiuKlfpNuuMyU
	8F7rgY+KnLIN77YrAvxj/kw8u7gRElLrujzHHAImqyBLu2d0V8dxbvjKfqukPydz7LaXB8pI7g1
	URKk7CtLOO4Ko4SUxsqVCf/ZZC0sKo+sp5/zRRP4IG5zOkwIIuxWQtlBKq+5kI+ZAKX6Zvpx7hH
	z65MkziM5+jeb3t3UCLqDY9nk4YsHCKbaSVlTvZVoaZEwR/6LkCBECWfOlS7faPtUt/8sTPajLj
	PxYrmsh2u/0YJrxg9PePfwDpw==
X-Received: by 2002:a05:6a20:7f8a:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd52823778mr474377637.15.1789461928611;
        Tue, 15 Sep 2026 01:45:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 21/23] ALSA: hdsp: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:22 +0530
Message-ID: <20260915084424.1007757-22-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 31cc2d91c8d2..0ade73057731 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3664,7 +3664,7 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 
 	snd_iprintf(buffer, "\n");
 
-	/* Informations about H9632 specific controls */
+	/* Information about H9632 specific controls */
 	if (hdsp->io_type == H9632) {
 		char *tmp;
 
-- 
2.48.1

