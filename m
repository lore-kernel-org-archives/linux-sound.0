Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5178C91
	for <linux-sound@vger.kernel.org>; Thu,  5 Dec 2024 02:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366031; cv=none; b=fi4stmGGlzQVBsnVjvy8H8/PKzUC7SwaTbRSJjsPP8rnMq2zxjiZCk+tqYS8Hv4lhAUm3tU25KeYfseLStHtx1xfcj8jfNFZ6142RIJBdfsICFU3F0Y7FGWTgoAmz3E+87rdpaw5PECuINdgGwg3CVpYLeiN00rjU4FrFbnMxeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366031; c=relaxed/simple;
	bh=xhvG2NwxZkcFR2qB1vfTSDmCdapS/aAksbx9vqP5zRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLVnkOgqst0hhFbfmUn/r/raXzHyL/0+EfhRIt7U3R66jH1oAgTejzR15ng0B3v5ZoRvZ/aojkx6wnrt/mHn6LzV8tl27szQ4TZuqs2YzHMW80/9JtZ0u/PsWMbHixqW57SJq1x8JZs7jSaDZnDwyRk9qC5T77AMG14ZpOOlpfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVtsZenq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVtsZenq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4349e1467fbso2647315e9.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 18:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733366028; x=1733970828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw/euE+jaRn8KaVOalk6xiOyoDYKCjli0xV5JRXUqKk=;
        b=HVtsZenqqmf2GIaHaHwMI4CQeBSGrP2f4KYceQoyYlX5igziiZQIR1068CCGOJxWrJ
         8cVYj9tRpbE2d6FNWADYkwUf/mPkTTbs4SMVab4CoNYBaaJRu7Tp/w/ZWCXZSisFLJGI
         yMfZP7szpmPqZ6qP08h9EMDa62W3Sh6/Q7iTwnzVBARES622ltZnwfWm9VzsomO89EWE
         rT/2uI+phns73rwwUEGI5+HUI6f69uUd/kPZD/Bpzh4nNFK5DsYV0gpMnZKTyiiWBCLY
         NuM/xw60tWyrpfns5WAyp9PY+WftTEcFiFso0I3ndYl0S4LwQuci5OgE0/8o+IcMj66f
         2ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733366028; x=1733970828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tw/euE+jaRn8KaVOalk6xiOyoDYKCjli0xV5JRXUqKk=;
        b=jCCcFWIBmJga7Kc7f5UcUA2v1oqfomJFsQMT8BH/4sDj+RW1KcGQL9pLIUKaEeANww
         wWWJr0dC4+4sEnxX6um4Q1o+X9nIG613RN3C90Qu0H69Aa8a4yQWbIYpcVGTEU8fcY3K
         Oul+0HIM3zkTXejh2x0OMeKNg3CcsKtl9VN1t22o7HLCgAOsffc9tDzqE/SIw/H+UP25
         ti7rHi4+81pZjeneAkz6Z7hKLWgRCRU+W9S9hmBsk5sR99vJ8MR9MopNCS8XfZQDdivt
         RX+bWpcQa6veLynWxShgOP0NIO4mZ6HHer764G3vaWbZ2+JP3U70ZAgRAKfiTMlUCMTC
         /g5g==
X-Forwarded-Encrypted: i=1; AJvYcCV4MVv2ZdS5nNlUcOi+Q3Vokxrh2utO6IuM/I5K0xwq+USAlXkDQf9erH1bAx+xgnp3gqI1qbVsvrTh+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMneyj/6Hci0P+Gtnfc7SFAtlUenwRCCcJoT125cvZXoifbseb
	HwYst3HuefwbcblQXK1q1GZaswylWJ2oaS7+ZrbeDHTDb/anpzF73cn5FiMDUsM=
X-Gm-Gg: ASbGncvWDtOKT6OAXv4r+JvulNTAUhQlYl+uQTdpViKFKb/KDHOK8gT3yWz6ZE2l6Wp
	CQX50JdcmdvZqKOZ2SevVQUNAFCjl5UjuxGWI3dMvgw1qxPBN8QSt1ATElba4fWR+0+/M7FT6OC
	oGsPRobfxR1H943wOPijPvVrhNb7obq4NvGdtD7E2aLEr35wuQe9BCwBBEurfwqSnfQNHf2vYcl
	0RWSWZgzfTVHTASzVJmgdQcB5W4x63txp/C7Tb3HMBxiS+CqB9Mu6KIYFlpCF7gnsBQ
X-Google-Smtp-Source: AGHT+IGRZIMmR1wcEX/dxzQ8T/nOq0eVnMC5OkJbJ1F2kUPg8auZ3LPl2T+hZ3Yyor0+FmhMD22q3A==
X-Received: by 2002:a05:600c:1388:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-434d09b1575mr75575205e9.4.1733366028411;
        Wed, 04 Dec 2024 18:33:48 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273440sm44444325e9.18.2024.12.04.18.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:33:47 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] ASoC: qcom: common: set codecless link to be a backend
Date: Thu,  5 Dec 2024 02:33:42 +0000
Message-ID: <20241205023344.2232529-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205023344.2232529-1-alexey.klimov@linaro.org>
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When codec subnode is missing in DAI link description in DT
the DAI link codec will be set to a dummy codec and link will be
recognised as front end. Any playback attempt will fail since it
will not be able to install hardware parameters. Fix this by
setting codecless link to be a back end.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 928cf5cb5999..e8ae15fcb1a3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -159,6 +159,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			link->nonatomic = 1;
 		}
 
+		/* set codecless link with dummy codec to be a backend */
+		if (platform && !codec && link->codecs == &snd_soc_dummy_dlc)
+			link->no_pcm = 1;
+
 		link->stream_name = link->name;
 		link++;
 
-- 
2.45.2

