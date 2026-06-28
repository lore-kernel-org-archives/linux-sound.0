Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B403A451B
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782647003; cv=none; b=uuaqPhQ/p0cCl6ykAOtlgra9V1fFjUwwm+NRLHxX94YuRfiU9oRAgsIDamltRUeni/FTo8XttMM8yD4TOcUoKbm37v/VmT1teRw106fjS+EXjqk6y2f/5DR5pMGzMYZgTBhEyHMhXke/td35RfW5yjIEgMvlW8GZ8/42m5/gPN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782647003; c=relaxed/simple;
	bh=N39faPtsUyWx0zZp7bXiSvHFUMEVQ6pXqJAeezmgVn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bn1JbYU6pefeILCHbltYHVA2cUhJIY7omyGpfGFybMsz+RTtPmn2d2PxDmQZNXM5iOSM7aTnjvP2qPk+jCfs7LEyy+uMESPxp42IuK1ipTtjtdVwi1dHVcNFqW3yVAn4TN5a4HHT78i28lTQ+NXtW06f/gt7o6D9UQjbuqknb20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf0SiTSk; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf0SiTSk"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-139a5f4ca15so2772998c88.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 04:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782647001; x=1783251801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REJz54h0FrHe+9JHOqfVuQUIu/kjnKs1vF346k6jsZU=;
        b=kf0SiTSkZFlD/a2+4oXKvZQtLVnacRgYtWvQ9Ct1TEZUmf5BXDDKUfsbM963XTyemI
         AoV3UCdSWLw3YMw8tCN3acCWLxR8YRhi0oBbARfzbu6K3Q1+ENh2qQe/Rd5OWn8iYsEP
         Man5kLcusUP5Xw4PjNYn13uQtLTYz4AgW5Cx63n0dkn6TuNqL6zLfW9rJBjmQczBxBqn
         B5WyWy+9a3BlDBzOPndMrQpC5rdZhmPLwvGNbMoLibhpDTTJgBWfyoIm2NU+pg71wRJ/
         2eK8pz1UKAJyvR0r29p+UMKNuQ+Na4hElcs7+e6YmwkoewIA5IaH6PquSSHZ8UiJSs07
         YNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782647001; x=1783251801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=REJz54h0FrHe+9JHOqfVuQUIu/kjnKs1vF346k6jsZU=;
        b=JlXcrCilFy7uav5EFW766yZLSTOhjj2ROS11xvDvLEeET0Q+giD+OUElO3CYHuuJsk
         JY7QTzZwyybL3EFpsHo6ZsA50AymGavvdjVGuBKPrVfJjjWpXy0bzDep1WxDotL//QPc
         D1IfAydJSP5p5+4alAzfph1J6MrsUmbLfdg6mnEYPW3iKnOpBAZpwX+7k+rOQK8P9K1R
         G9KcBNVJbYaxx2M54SvG0uQ+3JQLFJmJisgnMVDfWpTPV1fwL6itwnJgpik9USLiJWm/
         5zQh/RjrAErJsbCg5a2TNs8VKRGb8Wesw87+tkI9Te6Opg4yr04r5JK/O0z5rpsYgTPF
         Ty+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoOmQdIa9h4zkWENfhA2qaYLkYYqp8cSk6io4g/r17B1A9L20Oaz7QYXrUhH7z+krezR35aBJZg9yfLmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqYmkbRcV94xYmvAlHyfmR/gu2gnGaTL0ins+Jj+0HlrkNmnP
	VcxkYIoUrmk2wSJwWDyWync7AY+A5KoEO5HvJZgJZoRMIUJagQkKJk61
X-Gm-Gg: AfdE7ckiJHY0isjMcXvXpTXn5bLoszqS0cMayOiBEr21/2nRw4N49wOPkNrd2uqKmFQ
	5z2gCuewJ9U/YUlTq+4+OexMWA/+w086e9jOHTC9c32DaGxnYvLbuSlH3q402xNWrQx8S05dBc/
	vK9GFeF06smMSkW/S7azJ+/+T7OM+xFZQa7/bLZAGH4Cx1AYQLosxMgsGYj2IaWcTubqyIg6iJS
	xYcFfUAtBeZ/CSBHNbn5H8+b8KO+fkMPUJb4Uhd4CbT1ltJZ8jw1QWtznBIwvINpuGaYCMkuVjD
	dTVAx5HeWeQs96o5J8gkOtuEP7tBACYkF4nLj/o8R9AKxcB02IJjzGnPYLWtQ71cIJscz7ywzXK
	122N2s0WuydtY3sbYHmBSUKMhn0O1Krtta/HFTfoC/91jIjrFtvGdLOlf0PRwmcrGQFVyMNWvid
	cnadmhYzntEVU96pLpcvIsqkyZ83efgcf7eHK1Ltsvh7sCnjEpxx+aqMLDlLbNuIvUgmOKAy8Yt
	glGJFWjb6NyUyWWdm9YuO9EvmlIl5Prnt+8p644t53wAq3aSdJkrY1khYwp8IeXjg==
X-Received: by 2002:a05:7300:1891:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-30c84d127a4mr11002011eec.7.1782647001152;
        Sun, 28 Jun 2026 04:43:21 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:04 +1000
Subject: [PATCH v2 6/7] ASoC: apple: mca: Do not mark clocks in use for
 non-providers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-apple-audio-redux-v2-6-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3278;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=XRwHVvZBCMSQO4rx6pPwTOQibJ9CrgIML63jAT7bQFg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHHtmZnjMf69w3H7KAVEvva1pPM28uv6FcUprxB9rJ
 iyu1t3aMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGq3cIb/lZmpH+O6xQ86LV6xvTQ6dqvRA8+U/9FZd2qEdRSu21ucY/ifv2DyRf6
 Uh+6PtGRfhgnfU0r7qLO62+1C8rpVCbIXZkXzAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

On the speakers PCM, this sequence:

1. Open playback
2. Open sense
3. Close playback
4. Close sense

would result in the sense FE being marked as clocks in use at (2), since
there is a clock provider (playback FE). Then at (4) this would WARN since
there is no driver any more when closing the in use clocks.

If (1) and (2) are reversed this does not happen, since the sense PCM is
not marked as using the clocks when there is no provider yet. So, check
explicitly whether the substream FE is a clock provider in be_prepare,
and skip everything if it isn't.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 67 ++++++++++++++-----------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 5b5f2f27b152..a1da01b0be32 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -346,36 +346,6 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_prepare(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
-{
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_data *mca = cl->host;
-	struct mca_cluster *fe_cl;
-	int ret;
-
-	if (cl->port_clk_driver < 0)
-		return 0;
-
-	fe_cl = &mca->clusters[cl->port_clk_driver];
-
-	/*
-	 * Typically the CODECs we are paired with will require clocks
-	 * to be present at time of unmute with the 'mute_stream' op
-	 * or at time of DAPM widget power-up. We need to enable clocks
-	 * here at the latest (frontend prepare would be too late).
-	 */
-	if (!mca_fe_clocks_in_use(fe_cl)) {
-		ret = mca_fe_enable_clocks(fe_cl);
-		if (ret < 0)
-			return ret;
-	}
-
-	cl->clocks_in_use[substream->stream] = true;
-
-	return 0;
-}
-
 static int mca_be_hw_free(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
@@ -806,6 +776,43 @@ static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
 	return fe;
 }
 
+static int mca_be_prepare(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
+	struct mca_cluster *fe_cl, *fe_clk_cl;
+	int ret;
+
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
+
+	if (!fe_cl->clk_provider)
+		return 0;
+
+	if (cl->port_clk_driver < 0)
+		return 0;
+
+	fe_clk_cl = &mca->clusters[cl->port_clk_driver];
+
+	/*
+	 * Typically the CODECs we are paired with will require clocks
+	 * to be present at time of unmute with the 'mute_stream' op
+	 * or at time of DAPM widget power-up. We need to enable clocks
+	 * here at the latest (frontend prepare would be too late).
+	 */
+	if (!mca_fe_clocks_in_use(fe_clk_cl)) {
+		ret = mca_fe_enable_clocks(fe_clk_cl);
+		if (ret < 0)
+			return ret;
+	}
+
+	cl->clocks_in_use[substream->stream] = true;
+
+	return 0;
+}
+
 static int mca_be_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {

-- 
2.54.0

