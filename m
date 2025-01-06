Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C451DCB09
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174047; cv=none; b=Njvon8R5EVGvV/wxYU5INIjjJOMAw7wezD7aZrpG3aLdw4Zm6b8w/5KSIVlAp4eAN9jmWRGc8eOTK6b9TBt+nE7HUq9gefsR4iTR/qXWjSWLADsKXlGE6jzszB1O2uRIaDwxjeclbAe5OfOJqQMg2l9IhS70bqCocrtMqWJSdkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174047; c=relaxed/simple;
	bh=uiTzVrTUCZ3WSt6oaICrJzKtcpKhbkZxUd3KwPMCmu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hM9lACP/w5rfkiBr8v2ShFw46Xu/vJawvT4LnbpbN1Wjw4+Lvu/61R1VpLW/d/9/R9kBm2aPvlatf+yok9Q/k5U0c+JH/GPepTLCD4HTPp1V9aIZdKxft00Mu99IES4uRSULtAN9nuFaLJ3DjKLntoHM+MGzD8hXYjuN+wPiNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H3vctfrT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H3vctfrT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so143827025e9.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jan 2025 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736174042; x=1736778842; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJS2rW2T2RcSfQ5iAkA0Gffqe23ezlX4jRnbxIk5ccs=;
        b=H3vctfrTnrU4CJP/gvbDHoSxmnURSO0sbdBtgkB9RTYQSRktyNCsftGOJe7W/yh1hV
         +lO/drNR2cmL/vE/a26vsr/GOtEPG32n1Bn3LR7Pkq712wB2rUcdQ3+98ws8kfnuHOim
         P7y17gGaFQRLRMeoh8tDu61AimBaRwUDpLiCbmfNhTdkU3YQSlOCRRB5KveoyszEf/M6
         mrZ1o8ckIr+8vus4+w720wTRNd/6SvcO3Odfm22rnSaKuVzRac/4DR5H51de+aQyh5lA
         l1U2cggfF6AwA8d5olzwevNvyJfzjZdrX6quoGcNiS8XH89bM1A5HAeS/MkhebV6AAoY
         s0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174042; x=1736778842;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJS2rW2T2RcSfQ5iAkA0Gffqe23ezlX4jRnbxIk5ccs=;
        b=OA4mbNiuOFxZKt/wBCWGctTXWkmRj1mSLCP/YkxNax+WrPgeWsbTVdfAJ7K4mfWxJZ
         ihZnlNIRf2TzGEJoSszRe3oAzoasKOGsdQ0+y6V7fQsXHKRAFnuVjVAfv/gPGiykVNRB
         eLRWSy0KDs8bUZLigMar3ooXCXA5OgnFvQGrDC+2wnzj5ds96pruaQte0zhs+X+pS9XS
         Jg9xXxW91LcbZtFjUplTM8nYnnlGClHyyx2fmXfc23HKmixay9Qc9l4xqw4Q+btye9rI
         Vm//DIkfqxW6g0n0NAscY2v+wbNd9CJZETkZ8/1VYQel0uwtVxDzzU/Gsu5GCIucOlpS
         V99Q==
X-Gm-Message-State: AOJu0YxjCe3Jyrtu7OCTmZpTTrkwkeFtCZjuTXsTh51e1j8Zjlt2n1H1
	ncZgjUtMIOWCVF8sDowS8VaV1KYJmlGfcFf2FBtOtO8ZzvofWI0dkzXYX9pjpME=
X-Gm-Gg: ASbGncuUMFV6MnCga3FgLnkEYRlLqBxvXq8lRroMUJnHozh7SRnGub8FuyJ+Uxtxnwm
	oXIig+C2X6LY72EwkQG3JkhKHJIkUwI0vwQF8J5uFfrnRNdEUL96qRwYsFTQtdlGTwodN9HtQXI
	rIHLxRS/kwM/1G81LSQH0qnkFSALA77qi7bZXW4JgJNSX0FGoCELVqYCdAxOrESEpZ7+7xGZCvN
	/KgZ9qFpHIkE0wNxqX5vdmmLjChEhBJ49xQg5m8QP/2HFJtmilrmrlS
X-Google-Smtp-Source: AGHT+IFP7sfF3m4i727Wam1azM0kasnMNja3MbbIcuKtEVEEuVjvrxhTyPP+GTViojdnICts5GSdLA==
X-Received: by 2002:a7b:cd98:0:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-4366b2f95c5mr489415105e9.4.1736174042302;
        Mon, 06 Jan 2025 06:34:02 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm569164115e9.1.2025.01.06.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:34:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  s.nawrocki@samsung.com,  lgirdwood@gmail.com,  broonie@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
In-Reply-To: <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Mon, 06 Jan 2025 15:28:35 +0100")
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
	<20250106141316.375984-3-martin.blumenstingl@googlemail.com>
	<1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 15:34:01 +0100
Message-ID: <1jsepw9fl2.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 06 Jan 2025 at 15:28, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 06 Jan 2025 at 15:13, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
>> Codec driver can implement .hw_params and/or .prepare from struct
>> snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
>> callback has been called.
>>
>> On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
>> (sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
>> codec output because further digital routing is required after the
>> backend. The new DRM HDMI (audio) codec framework (which internally
>> uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
>> of the hdmi-codec to be called. Implement a call to
>> snd_soc_dai_prepare() so the .prepare callback of the hdmi-codec is
>> called on those platforms.
>>
>> For platforms or sound cards without a codec-to-codec link with
>> additional parameters (which applies to most hardware) this changes
>> nothing as the .prepare callback is already called via
>> snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
>> dpcm_be_dai_prepare()) on those.
>>
>> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thanks for working on this. Overall it looks good.
>
> Not sure if the call the .prepare() should go at the beginning of
> POST_PMU, as done here, or at the end of PRE_PMU ? 
>
>> ---
>>  sound/soc/soc-dapm.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
>> index 99521c784a9b..ac8eef217dc4 100644
>> --- a/sound/soc/soc-dapm.c
>> +++ b/sound/soc/soc-dapm.c
>> @@ -4013,6 +4013,13 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
>>  		break;
>>  
>>  	case SND_SOC_DAPM_POST_PMU:
>> +		snd_soc_dapm_widget_for_each_sink_path(w, path) {
>> +			sink = path->sink->priv;
>> +
>> +			snd_soc_dai_prepare(sink, substream);

I initially missed it but I think you should do that on the source path
too

On Amlogic, the cpu side of the link does not have a .prepare() callback
but it would be incorrect to do the codec side only if it did.

>> +			ret = 0;
>> +		}
>> +
>>  		snd_soc_dapm_widget_for_each_sink_path(w, path) {
>>  			sink = path->sink->priv;

-- 
Jerome
