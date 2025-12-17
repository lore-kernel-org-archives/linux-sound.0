Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5A352955
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971488; cv=none; b=iUu5055c3d6CgNHLxt9h9cYRqJV5Zfkkr0uVId23rTY+HDBZGMuqTTzuloqFFANWV7QElhgjsDiTVUtVRslc4Pc6VijkIMPh+Xl3WBWad7sVbM5tDTqu8zosnGPBESHqjI/oZB9JftW54QJCaR3JAgdb4oQ+PaaDMLtml8oCoPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971488; c=relaxed/simple;
	bh=fu7sMIYgUSh/v4rkjBNhREAJ1FIhusnRA78rCGY6UUI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=nYoRQ4NYi+k3gNXEvKNwTquIdZrdIOcJuFMAhRLniVblcwoee1tcMDUTsRC+XlLA8OC6cZXsC0nl3wdOQC2FP0VXT6JiBeC/xpjDuk6eUUbtUZ1n369VG0NoAIZvAto3LH/vtSuy71QktdCLXmxgpMmeV9i5zLEtNYKCjYrmQWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+d58dUj; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+d58dUj"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-477770019e4so52882395e9.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765971485; x=1766576285; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu7sMIYgUSh/v4rkjBNhREAJ1FIhusnRA78rCGY6UUI=;
        b=d+d58dUjx3fplfb9BR7VzEG9exatnCl8buZ5IaFR3+e7cnRsgY2Ho3S+o2XDy6scy1
         cNbJ6rm5mrw3IMVmOXJnIronvvqL4xBYAMPABGFyYY/wIEpnYRBh4CGdpqxmpjtOP94K
         FHg4kf0LsFFplh3h6Ppk/tpX3wGohHbdRqy9jd+RwuHZfvJTYwsb8hpJBihmnQM2dKpD
         Mo6qik0eXc6HgkbTb7DUrTTxidlApMko6FPrs2g/5MDs3rktfFheQ76jUCH8y73/rlbi
         88inoGEMWS0HdogzAeKqr9+dh0DzBEL9EewXDgmmrDU7TBWLpAzZ4T/8+prBNSa9M8m9
         vBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765971485; x=1766576285;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fu7sMIYgUSh/v4rkjBNhREAJ1FIhusnRA78rCGY6UUI=;
        b=hNNgYwF3hutnLvEsT86CFlGMMbAhTGFBYn5XKKmaU6B0LlrT3ZvgDYr9Nf+L0hDhpr
         ZGp7hpRxP0PR4vSMvG9QlcCLYuyXyWnwIRctPn+tgjbkgsLUTc7lTc8DnH1vGWkcPWPJ
         gTDsfvwPSs0JHNUgLAqX3W2s8eieKPjhpyC46JfIxhvoQ4lAKhQPDFs4/Sildqy0e0vl
         OZkpS3rFJ4R6n+AtMc1KTYHIqFFUzjKjdif1U8q35GqRlrMN1/nCglLlZaP1SdJBailI
         2cm6rajfg9SqHgNTSORew3HRICpAI5iBDEasfZmbQ3za5GOu75kSFJN0QLsQNNJ11ohg
         cnhQ==
X-Gm-Message-State: AOJu0YwTe02/dpHAKyBHdP2S3MYU/kXi/xcbVYvfH8vrVctHLbK/oOfK
	R22RD6xQro3i88TCwt0PbAjVK51v5KaoI1Fed7OKcMSUgGuMpxka1xQh9P5ig7GFgiE=
X-Gm-Gg: AY/fxX5SZ3qaMiE5bCddJ7hSwnn7GrbytqQjX7nd584zmEjvp89lnuF5inycGBxYg33
	ffKGG4GklLUjqjmVFEaavWGM3UGgoW9kBwF9tZWqH1ZfwMLmzKDSDwwisG2jeJIdkndxd3LX7nl
	XIiVHx5GmNLz8jFXxngCQdk2cvkv/bTn2AmAlS1+PBx7DtmPCtKA73hNWJbxO/BCYhsprpF7yGD
	IkLX/Ls0ln12QAtMg+6G8osnmmragiwD4FQ7rbvRMX8Me2mhb3Tiqg1uH11pg//dbrc2QL6gAxH
	S+vaSif5vlJEem06zCx8wfwKhyJyKmfTwjHVysOxJBOpt/ty8ROPTZWN6Glri8b1fR/fQzp/bFO
	tjsHX3VFE132vK3fg6FXTcSwePo8yEFX17Qxa51G3sp0oWG95yxUzPg5YJyyrjArkcEekrPTcP9
	pL6mU16skHT4NLa0sM
X-Google-Smtp-Source: AGHT+IHnX+LxQmLQiVs+ZpZFsuF5KyxBkwZoY99AYE5aZUalbfeBEMXFDIkjxf7sAdzdTezvtXYJLQ==
X-Received: by 2002:a05:600c:a46:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47a8f8a7d03mr182754515e9.4.1765971484924;
        Wed, 17 Dec 2025 03:38:04 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:95b6:94a5:9a2e:e813])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc14b421sm33633925e9.0.2025.12.17.03.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 11:38:03 +0000
Message-Id: <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <ajay.nandam@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
 <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
 <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>
In-Reply-To: <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>

On Mon Dec 15, 2025 at 7:29 AM GMT, Ravi Hothi wrote:
>
>
> On 12/10/2025 7:26 PM, Alexey Klimov wrote:
>> On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
>>> This patch series expands the existing constraints in
>>> the q6dsp-lpass-ports driver to improve compatibility
>>> and flexibility for audio stream configurations.
>>>
>>> The first patch extends the supported sampling rates to cover a wider
>>> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
>>> diverse audio hardware and allowing more flexible audio stream setups.
>>>
>>> The second patch adds support for the 32-bit PCM format
>>> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
>>> and 24-bit formats, enabling handling of high-resolution
>>> audio streams and improving audio quality for supported hardware.
>>=20
>> Is q6dsp-lpass-ports involved in compress offloaded playback on
>> existing devices? If yes, then how is it gonna play with
>> explicitly setting format/sampling rate to s16le/48k in sndcards drivers=
?
>>
> Support for s16le/48k is already available; these patch will expand the=
=20
> existing constraint so that customers can use a wider range.

Unfortunately, you didn't answer any of my questions or answered
a different one.

Perhaps the main one: is q6dsp-lpass-ports involved in compress offloaded
playback on existing devices?

Thanks,
Alexey

