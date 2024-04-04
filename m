Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FAE5B1F6
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712216333; cv=none; b=c3bSAnK4p/OyjUksnoFlJPfOwEV1OZB9SzburQFhTTunnKEyZEOcpRt4VtXvqPc8dtLElxgSF6kfeWufvhgtyavGgsj2qzPb0uECWxJjidPum2IhmB0H4FRS/R3xkTlnnTdfzRnJus3D9R5wq24duH7REEjcAtAwjmNvoxhgTHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712216333; c=relaxed/simple;
	bh=JRQbqG9dvdwBcgYHftBoddCN89kAvlWQMBhezfFQtC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eiHXIvx3hPZMgHZ9fXmBzLA1iVDVEiWYk3Za1RldovZe2kzr/x7FLO8qcEa/UoKdBZxVRLHlVycPQcQjOCb8lpgobRalm+sTshvfsdewuRTiQT2q8/zkBFYJkkYl5jOKGma0OH4X4qU972y18oh4QfBz0MdeOy8wlqdUYy8cAhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hxQIzQz/; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxQIzQz/"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c197d042fso659738a12.0
        for <linux-sound@vger.kernel.org>; Thu, 04 Apr 2024 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712216329; x=1712821129; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmb/MEHh47+ZYNv/6YgsJI1m65tIb2/eWlw2hu0WHw0=;
        b=hxQIzQz/HUn0/u0cWHOK6ob3OUU2USgu5kktqLt4pD8yoSGFJ8YYNcFIsFsylLdySa
         CfhsrsU2uUnwGqJ0SFsNoEsvJLQBSggBVBWK4puR8dM4of2xNLr/SxZUuuw2+TdSrriK
         Dnmoxsq9bhsnzo5m/OXNj2mYbuv9dCqZKDJMdGaoVJacfeFMKelVb7ThgLbhNIvDinfF
         1TckqgIYRqd2OsKZY8LG/Xx0sVbUb77EyD1QvE+3zKJEk9LG6I05gwpDFRExCSN7AMWA
         ntM1x1eUZXaEqeNkHO0Ri5VuEoeCeVVUDLA0Xh4FQvEmAiVm+3H9RB6zUrCSRGS2Pjjp
         Hx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712216329; x=1712821129;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmb/MEHh47+ZYNv/6YgsJI1m65tIb2/eWlw2hu0WHw0=;
        b=M8GJz5DXv+cGLzEW728aEMb8wCWpJc0MXzSaoFyS6Njrduax9FrXBRmMntcJJEtY1a
         BaQ6gkdIsqCJ3MsOCvF7aJPH/vtulrVum2QQhYDFFG4Y2hmxVhc5uqt1L45wvSWV5SRY
         +EopGyPxWcHBWFfDKS4cYuE5I1bWa1TCuByM7mi7HLtARNcKD83VeOn8jEfz7j9eS5Yh
         0QXIGifxlVtJhIFCMLOYWAE5au9JfTW2KICoKyKc8NqjQGM6vvnNpdvOm9p8WWl+VDwF
         laH4pwk9NBthhjcUxBB6IdHSfDh1tdLfdsIDtw9D38YD+3pvB5zO66DAiqxhlkJs0/eO
         cGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOTdOF+u6zOLVhrM3uWL3NtTfCcwBy9eAaDaC77xuPXsDk4CBoxAW/zqFmzvvjIOgpsBbNgV0yFIZAsEU1AueQO6WJZHiJf6QgLDw=
X-Gm-Message-State: AOJu0Yx35irtxsFL2wgBtcxHsvrBUxiDTwRJas3dnkLYqN2UcQxX17TA
	rLTydTecVW6EJSyT8LV7w+dhGrBk1qWTnSZyEzGFHNbV0nSOOV9PX8YXoLW8yj8=
X-Google-Smtp-Source: AGHT+IHE+q9ZZKNYKvoonZR5Fvl2siN6wSOxvSeOM9MxOaAEVORcHubD7hn/X+A6eP1b1L93x+mGtA==
X-Received: by 2002:a50:d75e:0:b0:56e:2186:847d with SMTP id i30-20020a50d75e000000b0056e2186847dmr254514edj.16.1712216329436;
        Thu, 04 Apr 2024 00:38:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ef15-20020a05640228cf00b0056c1380a972sm8849750edb.74.2024.04.04.00.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 00:38:49 -0700 (PDT)
Date: Thu, 4 Apr 2024 10:38:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Disable pointless writes to debugfs file
Message-ID: <9d2477cf-25aa-4d12-818f-fdafc9aaa28a@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The permissions on this debugfs file are 0444 so it can't be written to.
And writing to the file hasn't done anything since commit 6e9548cdb30e
("ASoC: SOF: Convert the generic IPC flood test into SOF client").
Delete the write function.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I haven't tested this patch and there is a risk that it breaks some of
the test scripts.  Another option would be to just make it a dummy
function that does { return count; }.  But I thought I would try the
better option first.

Please review this extra carefully.

 sound/soc/sof/debug.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 7c8aafca8fde..937e51b02a24 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -19,24 +19,6 @@
 #include "sof-priv.h"
 #include "ops.h"
 
-static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
-				  size_t count, loff_t *ppos)
-{
-	size_t size;
-	char *string;
-	int ret;
-
-	string = kzalloc(count+1, GFP_KERNEL);
-	if (!string)
-		return -ENOMEM;
-
-	size = simple_write_to_buffer(string, count, ppos, buffer, count);
-	ret = size;
-
-	kfree(string);
-	return ret;
-}
-
 static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 				 size_t count, loff_t *ppos)
 {
@@ -126,7 +108,6 @@ static const struct file_operations sof_dfs_fops = {
 	.open = simple_open,
 	.read = sof_dfsentry_read,
 	.llseek = default_llseek,
-	.write = sof_dfsentry_write,
 };
 
 /* create FS entry for debug files that can expose DSP memories, registers */
-- 
2.43.0

