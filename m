Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65752765E2
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469134; cv=none; b=LatjDBjYEvXSMpo/OSDTHatA65kfzfLEwz26Z6h8kvR7VRjwJj8UFIX9c/o3OJ+H4M8+SyzjOyGy7XGe28BhqRrYyssQYMWiKXLWL5qQZlZJd71+8AmnTKdRPqM/P9sGSToNar0kwWbKG2Ctb0BgiJzqff1394CqtS9ajg6t+c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469134; c=relaxed/simple;
	bh=JJ8nr2t7WkOuI49GeZpoE8Xclx7zj3BlOrTzAMDaCaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QStg6rKyRpgvA2GQYFHs9a+EeTDSOp0U4+ZyJlaVZCy6HcZaA0wvIwQ8sXDF36BYFDu/G7UgJXPUROvLUGoVk4ZbIDeFgKeq338zZXGse5dwcQCyIcQ6FKRvgp8fmhf9rNh3nl86aKYAeoxA85z8iYtMHISF8S81HSenTYJ9lYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBM3mWl9; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBM3mWl9"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1279eced0b9so351660c88.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 13:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774469133; x=1775073933; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ua32fXNS7IcDMCnQI4uw/Ijg3hcYV5XkjVPRm0WAddM=;
        b=PBM3mWl9nR2C6aY+/cf1zWH/mk41866AwC3ulBs7coxudXWwwq5U8YQwLk894iw3cv
         z7NsUQVAGwR0tuquwskzsH/+KgQfn+Ows/Grwm3/x4ifLn7drVlFx/TmdVYxhlgqoySc
         yigU5curWzAfeum8QAUNQVVtXPMyH7xOTr8Y96KGXqhExTuekeKeJg8ll+Bhg/ErheR3
         ze5PFtobAfgMT1kODpEQsXihfOlZIfhNkoFbAHTvCknbiXTbkhKGxPyPLCLzSjCX3vfA
         CPoo2a2QK+/XIjQXRFz2OErAe6FRFqKTip9ExB6mnBVuiQnH15P/oNCQcSdgLA37LH9s
         bLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469133; x=1775073933;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua32fXNS7IcDMCnQI4uw/Ijg3hcYV5XkjVPRm0WAddM=;
        b=fbXi8K4m7/CxK8aOTxqhLqohuqEuyGSJ/HJJLQKfv0o2oJpIaCU9Mfo/Rp9ASQW2yj
         Doc2Y5lokIJCIAXsZ1Kdj8xg4+Bx+kTCzpIwgWC4Fee1nNIsYMhuobYX7rn3HrhqIX8z
         umMTYH9nfXyCSNk6T8qwSRiWAwCTwr0bTvJ1J2lygxeaNz1bAQlwhnWlqlfuZ/K36nNw
         3xk6k56G0mxG6tgPoj+X2NdEY2MiiFcu5hI7tFT3xM1oWEZt5vAjYxsYsRK9Moowgh0M
         Eb+7mq/UubmdEugQEYKuOjpT2ybXooIzOlaHxfUKH73xxNecSSbW02S7XVhA1+JcyNCw
         oe9g==
X-Forwarded-Encrypted: i=1; AJvYcCUPEFWd7g/dXktuTBWPyYX1+XnyE2IPXq/Qhz+vX9/74AXvkTmlxpcLmghCX0jTN+mlNekE40xdJsKANQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLXzXefhwDCvIBNSDOTScQYJPbIndNgVbRpbWqEaxgQG8m18J
	q+qTxcFjxyOQumHaYseukHOFQHtYHBEqa3UyNNAtq1nRpcTYFAlPjsrQ
X-Gm-Gg: ATEYQzysBfsZ/8RMvLoCW2a6e97zNomeo2N3hs9gT/h6YFtDpisZlv5IuJyy1JaEkDK
	Chk/qq1T+jwKxHGPMWIwqs0M7bns09C85ipnureOP73rQAfOYLZX8HKeKs2Q4pA7epYMm6pDMk4
	9MKVYIoqD2uWRGiQ0mu+vVtrEa93iWJjkQHYRS31w6Ixk/HSmON6NkxgFlhvYOnxd0/K3YQw7ef
	IShGsMpeMShXQ498gvSwqmq5aOcI5A7+O+mr8/nLORrXNq/Js8gesW8qSH+ETi5a1rPdao3gzIq
	15Lq550g3JTDlis531Wir4fL+XMeudZ0UC5xFpkNr5oMHEWaPez6Z0tN2jCuz/4Yi9TRxU6v8sc
	h9nMz8Nb44CjkBkwBbvi1SnE1AqBL1WFIW7p8MLw1KtXjKd3H3SjTqKazrY6q4OhBggsrRH6neI
	S0QY/wdlgqifxhIWXVN5snAqjAMtoShaWygEiaLFiin4gPY+g/oh11r0oisa2wlMl8sBDYr9kWb
	94=
X-Received: by 2002:a05:7022:662a:b0:11b:9386:8254 with SMTP id a92af1059eb24-12a96f00133mr2321421c88.41.1774469132676;
        Wed, 25 Mar 2026 13:05:32 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7273848sm701559c88.7.2026.03.25.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:05:31 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 25 Mar 2026 17:05:11 -0300
Subject: [PATCH] ASoC: SOF: compress: return the configured codec from
 get_params
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-sof-compr-get-params-v1-1-0758815f13c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2ICUbwKuIiTUc7gibMqBTEu
 zdtl2/x/wVKwqTQVxcInayctoKmriC+wjYT8rMYrLHeONuipgljWrPgTDvmIGFV9N5E51pDTee
 gpFlo4vdvO4x/6/FYKO7fF9z3B/uO9MF4AAAA
X-Change-ID: 20260325-sof-compr-get-params-660c3350e173
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=JJ8nr2t7WkOuI49GeZpoE8Xclx7zj3BlOrTzAMDaCaE=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlH7P83xicu0tsd5HFnlpJXafw5nc5s7avcG7v3PoqJE
 hQwurmto5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACbi9JXhr9xCuaR9krm8mZMf
 3esQ+2D35HdmdVheVFx/9uXkhIsRbxkZLlyfo3nX+o76fSbOpZL8Ra/t/BjL3t0/UO63sOLBZz8
 OdgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The SOF compressed offload path accepts codec parameters in
sof_compr_set_params() and forwards them to firmware as
extended data in the SOF IPC stream params message.

However, sof_compr_get_params() still returns success without
filling the snd_codec structure. Since the compress core allocates
that structure zeroed and copies it back to userspace on success,
SNDRV_COMPRESS_GET_PARAMS returns an all-zero codec description
even after the stream has been configured successfully.

The stale TODO in this callback conflates get_params() with capability
discovery. Supported codec enumeration belongs in get_caps() and
get_codec_caps(). get_params() should report the current codec settings.

Cache the codec accepted by sof_compr_set_params() in the per-stream SOF
compress state and return it from sof_compr_get_params().

Fixes: 6324cf901e14 ("ASoC: SOF: compr: Add compress ops implementation")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/sof/compress.c | 8 +++++---
 sound/soc/sof/sof-priv.h | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 3dbc05bf3b79..f4c3e10e6344 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -255,6 +255,7 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	sstream->sampling_rate = params->codec.sample_rate;
 	sstream->channels = params->codec.ch_out;
 	sstream->sample_container_bytes = pcm->params.sample_container_bytes;
+	sstream->codec_params = params->codec;
 
 	spcm->prepared[cstream->direction] = true;
 
@@ -267,9 +268,10 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 static int sof_compr_get_params(struct snd_soc_component *component,
 				struct snd_compr_stream *cstream, struct snd_codec *params)
 {
-	/* TODO: we don't query the supported codecs for now, if the
-	 * application asks for an unsupported codec the set_params() will fail.
-	 */
+	struct sof_compr_stream *sstream = cstream->runtime->private_data;
+
+	*params = sstream->codec_params;
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 693d063830fa..38753b088fc1 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -17,6 +17,7 @@
 #include <sound/sof/info.h>
 #include <sound/sof/pm.h>
 #include <sound/sof/trace.h>
+#include <sound/compress_params.h>
 #include <uapi/sound/sof/fw.h>
 #include <sound/sof/ext_manifest.h>
 
@@ -111,6 +112,7 @@ struct sof_compr_stream {
 	u32 sampling_rate;
 	u16 channels;
 	u16 sample_container_bytes;
+	struct snd_codec codec_params;
 	size_t posn_offset;
 };
 

---
base-commit: 5c3743212c70461c076cb11c83c899695a1528f8
change-id: 20260325-sof-compr-get-params-660c3350e173

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

