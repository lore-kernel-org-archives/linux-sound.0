Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553706;
	b=4th7x9lQMBu9z57NPy6kVVdKqd//zbn1YTDTvQUfqR8HPDvuXIc1C90qEofCdAlm8zkn
	 HhvyWWhvswin19tPcKcLfh96MpNvv5Wv6Nn9orqXnXGO7/mRwUdjPkHQAyht1g2JsUQg3
	 AMP8jV85VQFpuKAqaumZKo7G0YsVPwDsT80ySRw8oKl6MAejj55z2VGlI0kvOQ3cfWVYT
	 Ab0WjnfSf5Gp9WdqMayk6nLCC/VIiIhALs6IhmEsfqf4K1MTqehHwG08EJX3K13a3Z+qn
	 2GBBp+CWIf9Rux7CtrdeLyz6hSCVuyO2MHw5x7GrGiH+3C+z8LCmC10ff9/nWKq18wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m14LVY7DENSypGjrtlzsQ8s45wKBaSdm3JiuYqURwGU=;
	b=jZpn8lSJXZSx2oK6k0bCLcpLKGlncMJWVUOiqZb0h6t9oogAGEt2Up4l7o6H98xhPJzs
	 ODyEqtdlsj7yCqxWrkdOdmR3DQEqlVthOrIpDtrAa//sL9FNetl5Vw+8o8wzeJiEr9fnh
	 5nMHvqmAb13lR/gvMQzI4dEFOUaoz3B5Ml8M3rfgeuxREPKFp+FsxN1yYBp1kYgnjB3oX
	 f7eskjLdmNViI2qabGCjZiXNaJ2mCb5Qz0t/bgMn6sB2Yjb8YjXX1yHHyuvT8tm5F6Fdl
	 bisGed/tcqnAF0Y8VYuG/ORYg+IDjQgYE3BZWnr1pCL7BR9KOHF7Qe7nddi2p1/AeXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=D1r1tWNz;
	arc=none smtp.remote-ip=74.125.224.134
Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B37606A329
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B37606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=D1r1tWNz
Received: by mail-yx2-f6.google.com with SMTP id 00721157ae682-8acdc42ffa8so9929297b3.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553704; x=1794158504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m14LVY7DENSypGjrtlzsQ8s45wKBaSdm3JiuYqURwGU=;
        b=D1r1tWNzZ2MFxniUwm2wNGW9lQ35qgeKmGvMgEyN08MbJe/nlVeUTDY8cYEBmM02ok
         0tuH6IALfPNmzGBPopmvP0biWu4CG+BuvOD4lQ9c78AKtwigBYFerhZaF2OHwlbgjlzO
         9YVqVqHyZ57l22DlMulSEeRIG48b2oIgwjvrYL2Rj+9795EdXuWYqCjCDlobwh37+QXo
         Mf9Ejdw1HY7+YMGX/Lad1GegN6ck4ZUVvv1oOIT0oWn7Kustie4bhsgGDJjUit0FJgrQ
         rbw507S8pBuFTZYq6Po/CZS6tGilP0xCZByE+mrWOpqL5GQdhW6O4Nst+6z7IEfBoE+n
         ulVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553704; x=1794158504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m14LVY7DENSypGjrtlzsQ8s45wKBaSdm3JiuYqURwGU=;
        b=wlXp395QXwOn68eVaVnlakrTKgQJqNoMLWlmeawNvpURO9eJOMoOfNPVKcueegqmXG
         CgmUO0QM4jV++6R1K5KHCsxD+kteIJOpYR9nBFw/R1HeUHpXwQNY906MMrIMKX6CEqiu
         ggcSzjJJtrCGcE4o36++9TJnehy/b5QgDMWPnY4zObiqTIVLSLT/l4h4L0Feuj7xuWrj
         jY+kuJQpaqiIlVYykJmcqrrCQfzJcJxcVgZyN/RnZdOcBSkyfXWDwWsxLqjmdberklZd
         MPFGDQVJPFknxh+wY7hYBpXzN8vZ4tBZHRiBtFpzrtrax2zFjirQ6eASn7yvoAWMPGLh
         wzGA==
X-Gm-Message-State: APuU4Z9J9B/1acH8QvrYYONfY8P/v/zcAEiLM8m6h5wLXJEU9Q1mhCHt
	Ot9opUMKvDULnueQoy1H3wG9E3/M+z2cW1eIPXWQj5ALQxE8JOGJaeqIkWr8D0hauQ==
X-Gm-Gg: AYBFou030nfeyrrdHzFGSWTLKz9gbudugXBgh8H5hb2MsUIS8QeXJStm/q9Gtga34bM
	Kq6YdO7e3W6cPryW6tApUMFnVEH4pweCWAkyIULRCnk+WISGWcwWRXKlGK0X/I3ny1vFYyZ5uUB
	ETzhaOLETzDoghABaz0A098PeCfMVvLgV96PHxA576WyJlwE6CDQHG5SXZQ8UCHNZJoO71k7S8B
	7AQ0v4+67diINpEhGUALgACyQC+5wmMZpt2Q11wWRpQQRFP6l7ljTwoy7QR2/a+9gnpgW9FtBnL
	/8ORHqOcXJXYZUfe2zjfCWI56UiQUcvV0I4SZEjype6vj4UoXr6iuMttB1GkUQA0lpwiIQSsdTO
	EAyDvrjXFhAOCkaWBo20taEfNDPlNpo9+YlITJThJbagImQGwBBKD2UnxO8FS5+9P4psegr9VIo
	CQxKT1oTvSr2RAkeAhUacBitvGjI1IV6rZSGbihq3bcmhbb7IltFC57xefyrdFs1UAA/rRmLQjC
	SB1LHsGSUZ6tpcVp/2VLRc5wvQgq0tkBZiL/2w+n1Hpbi8ED5xFB98e1sAu0HlHrOFlLgA=
X-Received: by 2002:a05:690c:e217:10b0:8b0:da2e:7a12 with SMTP id 00721157ae682-8b2b674d13fmr31076597b3.46.1793553703688;
        Sun, 01 Nov 2026 09:21:43 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:43 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 1/5] ALSA: hda: Make snd_hda_multi_out_analog_{prepare,cleanup}() return void
Date: Mon,  2 Nov 2026 02:21:30 +0900
Message-Id: <20261101172134.3451066-2-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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

snd_hda_multi_out_analog_prepare() and snd_hda_multi_out_analog_cleanup()
always return 0, so the error checks on their return values in
playback_pcm_prepare() and playback_pcm_cleanup() never trigger.

Make both functions return void, and call the playback hooks
unconditionally.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/hda/codecs/generic.c   | 22 +++++++++-------------
 sound/hda/common/codec.c     | 16 +++++++---------
 sound/hda/common/hda_local.h | 14 +++++++-------
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 6120f797b45a5..ca780b7f688f6 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -5324,14 +5324,12 @@ static int playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 				struct snd_pcm_substream *substream)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	int err;
 
-	err = snd_hda_multi_out_analog_prepare(codec, &spec->multiout,
-					       stream_tag, format, substream);
-	if (!err)
-		call_pcm_playback_hook(hinfo, codec, substream,
-				       HDA_GEN_PCM_ACT_PREPARE);
-	return err;
+	snd_hda_multi_out_analog_prepare(codec, &spec->multiout,
+					 stream_tag, format, substream);
+	call_pcm_playback_hook(hinfo, codec, substream,
+			       HDA_GEN_PCM_ACT_PREPARE);
+	return 0;
 }
 
 static int playback_pcm_cleanup(struct hda_pcm_stream *hinfo,
@@ -5339,13 +5337,11 @@ static int playback_pcm_cleanup(struct hda_pcm_stream *hinfo,
 				struct snd_pcm_substream *substream)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	int err;
 
-	err = snd_hda_multi_out_analog_cleanup(codec, &spec->multiout);
-	if (!err)
-		call_pcm_playback_hook(hinfo, codec, substream,
-				       HDA_GEN_PCM_ACT_CLEANUP);
-	return err;
+	snd_hda_multi_out_analog_cleanup(codec, &spec->multiout);
+	call_pcm_playback_hook(hinfo, codec, substream,
+			       HDA_GEN_PCM_ACT_CLEANUP);
+	return 0;
 }
 
 static int playback_pcm_close(struct hda_pcm_stream *hinfo,
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index e367cc1c6e78f..51189e305ece6 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -3798,11 +3798,11 @@ EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_open);
  * Set up the i/o for analog out.
  * When the digital out is available, copy the front out to digital out, too.
  */
-int snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
-				     struct hda_multi_out *mout,
-				     unsigned int stream_tag,
-				     unsigned int format,
-				     struct snd_pcm_substream *substream)
+void snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
+				      struct hda_multi_out *mout,
+				      unsigned int stream_tag,
+				      unsigned int format,
+				      struct snd_pcm_substream *substream)
 {
 	const hda_nid_t *nids = mout->dac_nids;
 	int chs = substream->runtime->channels;
@@ -3865,7 +3865,6 @@ int snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
 					   stream_tag, ch, format);
 	}
 
-	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_prepare);
 
@@ -3874,8 +3873,8 @@ EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_prepare);
  * @codec: the HDA codec
  * @mout: hda_multi_out object
  */
-int snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
-				     struct hda_multi_out *mout)
+void snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
+				      struct hda_multi_out *mout)
 {
 	const hda_nid_t *nids = mout->dac_nids;
 	int i;
@@ -3897,7 +3896,6 @@ int snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
 		cleanup_dig_out_stream(codec, mout->dig_out_nid);
 		mout->dig_out_used = 0;
 	}
-	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_cleanup);
 
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index 947a3152fdb53..8bd4497a6b090 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -241,13 +241,13 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 				  struct hda_multi_out *mout,
 				  struct snd_pcm_substream *substream,
 				  struct hda_pcm_stream *hinfo);
-int snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
-				     struct hda_multi_out *mout,
-				     unsigned int stream_tag,
-				     unsigned int format,
-				     struct snd_pcm_substream *substream);
-int snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
-				     struct hda_multi_out *mout);
+void snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
+				      struct hda_multi_out *mout,
+				      unsigned int stream_tag,
+				      unsigned int format,
+				      struct snd_pcm_substream *substream);
+void snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
+				      struct hda_multi_out *mout);
 
 /*
  * generic proc interface
-- 
2.34.1

