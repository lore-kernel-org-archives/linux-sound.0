Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFC725785E
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976423; cv=none; b=pzriIQ4L3/sostW4kuAeId0615Ny8xsQ0f+yBO6n07z07pj0DVH/kHCloaa5GvdSIzsfR2qkeZcmNxB1np+K+p+4MJnfj3bJ/KDmvjMUBzqGjLKpU7JxddnDcleqT90Pi1t3fzBBTndSvdT55v1nFyHo/HKQEmRfPpYuCbcLHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976423; c=relaxed/simple;
	bh=nyRQ9Qof44nv6A52rMjCgW0G7p3RsfNzqOzQ5bMpU5M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E0f14wpy6qFta+5pN3RR+nZXejpSCnnzJIagNZeAPgru5/6mAtM+biuPWSJzWwjPZlBogw8wDHYEmF8WqlaDs3GptsWLv7ug4xX2xORLxMYs9As9pZsba0E1jf1vsfHCVnUvJEHdlDrabUJPKbqloIZlNASjmp9wSS3UU3SiQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+ekcTIq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+ekcTIq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso20308275e9.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760976420; x=1761581220; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hWu3f56wYzYCaWSvnDXOsMuNZmZt0A5/MWZu56vU6c=;
        b=l+ekcTIq2uQIRXry1mZZp0JRWxWkOrS3itjw1Bemi8z0FYr38lSAVLRkIZI7qRmAfh
         a3qh+tlM5+1OmaapQ9JdLjlSzejXoW0z19xb/mJPEcWxUxj9vUOTWSZCzqpgeQu9idZI
         BD6Y/OWa8lTcPhOs7h+Db8Vp9uB8U4h9kk4h1Q3RJP5E/lXN5c5P3spnntcPQPbF6RiP
         Rk3wgeYs4tdqN4sUu5QXmai3KjsDPdUjhEVW+oUtnMrPz19pWJDb0A0PZeqHGxmTmjps
         WUq661oedh+wzqBXhsrVGuNJx7PPJMYlT3WJ8chyIjmvnhkrEJqrreW+QjYhRIcAncor
         Yrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760976420; x=1761581220;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hWu3f56wYzYCaWSvnDXOsMuNZmZt0A5/MWZu56vU6c=;
        b=Tb9yygqJs4PJIsCIhgOqN0Z0KxTUQ8fm/No2YYn7A+K6cwVanqcOfp4yw/ViUSxzJo
         HJNqPPRsk5nIzZVCvakwAKcjTRKX7/3SMVPuDirnC/1/Og4oiAdOlEWHupVdjOqUQ7oy
         REhgP9Z48hTemjiNyjqQHuGsR6YS3Qtq6sAphnMV6O3bzXpn4RAf2GvWLfpRexhprr7x
         oulgiS70JHKNUhaGe42PLmfmx3QxV1rN3G/FqTinWbB+wThYuZb0c0+BSUZGyPmApjQG
         FKhGULPmS3U1Sko1hBKBHNZLC7M11c7e+X+QO2sXc6LmXix0oS556nHFxTabqYYqSv5/
         cWeg==
X-Forwarded-Encrypted: i=1; AJvYcCVygmXP/9eVobqGed6NFt7qk8C4nL4S4LhstUm//bf/dSddUIVcri+8rD8sGPyftyVMxldlGg2lTHvfbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXnSiOINs2FXhQ8aZFqrREayCmVusgwGF4wrc1vkg7z41RbslI
	pcHM9X0VTUz0Uwyd9/DbKc0LqYzj36QwaVsKCvzgZuF6Y5qFGTifljVNrKf+QDQKsOo=
X-Gm-Gg: ASbGncuGsPsqANJZG2uBoa8KE/j2rubBctkszdgDtPrzfYOljp4j8uDMk6buWDUErK6
	G8KdnZB0zz/ucwG5CVqh6dxLenxSHJMZQj6dvzvV2gDE7aw2VzzD/V9PqlUeQ2PIeWsAttLSvQn
	TtKpScMmP9AXz8O7N9tPR6dsObMzdh6CJ2ngvPjHAvR6eJFSPSs1I/oWJG7BTysDeUX5VePjL2e
	rZ8KArbiwR3PhvYK5lbmnS7KJTPMKXujLNIOzuKCIEXOBXj7z5C/R3CZZtfMec4hsIgqXQtWJ6R
	zvYQsHKCh8fqfXJ55GqYYy3nmtMqFwe1Hy/a3ekgRhZ+CRfU1xl3DIr9YUbLuJj/Bz+cEZTMypo
	+PyEaSFSivjJC3y965u86P/8swnUErfaoQkxZSmojoFdsR3FiXI7W7ONU4dWpktktAZ4PqExdEK
	EJKw0=
X-Google-Smtp-Source: AGHT+IF7hnsvzq/FOhnyy/fhx/q3295ONhA4cTGp+Z3bSorXcrnpFfdXDzf8asUw0CxHtIo0d9WN9Q==
X-Received: by 2002:a05:600c:3b83:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-47117925171mr139570305e9.34.1760976419704;
        Mon, 20 Oct 2025 09:06:59 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144239f4sm238249505e9.2.2025.10.20.09.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 09:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 17:06:58 +0100
Message-Id: <DDNA1IMADB2J.1RQMGCQKDL7PG@linaro.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 6/9] ASoC: qcom: q6asm-dai: schedule all available
 frames to avoid dsp under-runs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-7-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-7-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> With the existing code, we are only setting up one period at a time, in a
> ping-pong buffer style. This triggers lot of underruns in the dsp
> leading to jitter noise during audio playback.
>
> Fix this by scheduling all available periods, this will ensure that the d=
sp
> has enough buffer feed and ultimatley fixing the underruns and audio dist=
ortion.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 34 +++++++++++++++++++++++++-------

[..]

> +static int q6asm_dai_ack(struct snd_soc_component *component, struct snd=
_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct q6asm_dai_rtd *prtd =3D runtime->private_data;
> +	int i, ret =3D 0, avail_periods;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK && prtd->state =
=3D=3D Q6ASM_STREAM_RUNNING) {
> +		avail_periods =3D (runtime->control->appl_ptr - prtd->queue_ptr)/runti=
me->period_size;
> +		for (i =3D 0; i < avail_periods; i++) {
> +			ret =3D q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +					   prtd->pcm_count, 0, 0, 0);
> +
> +			if (ret < 0) {
> +				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
> +				return ret;
> +			}
> +			prtd->queue_ptr +=3D runtime->period_size;
> +		}
> +	}
> +
> +	return ret;
> +}

So when I compiled this on a common arm64 desktop machine with defconfig,
nothing fancy, with gcc, this loop and function really does compile with
udiv instruction.

avail_periods =3D (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->p=
eriod_size;
     350:       f9001bf7        str     x23, [sp, #48]
     354:       f94086a0        ldr     x0, [x21, #264]
     358:       f9408262        ldr     x2, [x19, #256]
     35c:       f9400000        ldr     x0, [x0]
     360:       f9403ea1        ldr     x1, [x21, #120]
     364:       cb020000        sub     x0, x0, x2
     368:       9ac10800        udiv    x0, x0, x1  <--- here
     36c:       2a0003f7        mov     w23, w0

What do you think about rewriting this loop without division and
without using additional iterator? I don't think this is a hot path
but anyway.

The first iteration that I came up with is (1):


diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-=
dai.c
index 97256313c01a..d01f805947b8 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -310,6 +310,23 @@ static int q6asm_dai_ack(struct snd_soc_component *com=
ponent, struct snd_pcm_sub
 	int ret =3D 0;
=20
 	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK && prtd->state =3D=
=3D Q6ASM_STREAM_RUNNING) {
+		if (prtd->queue_ptr < runtime->control->appl_ptr) {
+
+			do {
+				ret =3D q6asm_write_async(prtd->audio_client, prtd->stream_id,
+							prtd->pcm_count, 0, 0, 0);
+
+				if (ret < 0) {
+						dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
+						return ret;
+				}
+
+				prtd->queue_ptr +=3D runtime->period_size;
+
+			} while (prtd->queue_ptr < runtime->control->appl_ptr);
+
+		}

No division and no calculation of iterator and avail_periods.

Rewriting it further (2):

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-=
dai.c
index 97256313c01a..317f06d07a09 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -307,9 +307,26 @@ static int q6asm_dai_ack(struct snd_soc_component *com=
ponent, struct snd_pcm_sub
 {
 	struct snd_pcm_runtime *runtime =3D substream->runtime;
 	struct q6asm_dai_rtd *prtd =3D runtime->private_data;
-	int i, ret =3D 0, avail_periods;
+	int ret =3D 0, diff;
=20
 	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK && prtd->state =3D=
=3D Q6ASM_STREAM_RUNNING) {
+		diff =3D (runtime->control->appl_ptr - prtd->queue_ptr);
+	=09
+		while (diff >=3D runtime->period_size) {
+			ret =3D q6asm_write_async(prtd->audio_client, prtd->stream_id,
+						prtd->pcm_count, 0, 0, 0);
+		=09
+			if (ret < 0) {
+				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
+				return ret;
+			}
+
+			prtd->queue_ptr +=3D runtime->period_size;
+			diff -=3D runtime->period_size;
+		};
+
+

Surprisingly, in (1) the size of resulting object file is smaller than in (=
2):

With original patch:	110008 Oct 20 15:26 sound/soc/qcom/qdsp6/q6asm-dai.o
with (1): 		109776 Oct 20 16:53 sound/soc/qcom/qdsp6/q6asm-dai.o
with (2):		109896 Oct 20 16:52 sound/soc/qcom/qdsp6/q6asm-dai.o

I think the readability won't be damaged as a result of the rewriting
and the code seems to be smaller.
Obviusly, this needs to be verified for some corner cases and etc.
I'd go with (1) but it is up to you. I tested (1) and it seems to work.

Best regards,
Alexey





