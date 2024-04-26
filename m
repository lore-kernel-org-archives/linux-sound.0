Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF63F9D4
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 23:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714173576; cv=none; b=mSdZPhRwDN/sv/xiorNkJrOOU63Os/+2JOI/z2N01mtKbp8VnEFdrbG/WsCbuvqCKuup3cfx/U2td5S6dMe75NEpeRMTUeWtu76T6kE+TyIMVfrBlv3XQpnWIn8E0xpGW+PSglh3k3WwQhmd1OYVhD7VjsA8b0mF8s20U5DySsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714173576; c=relaxed/simple;
	bh=bbLgy3NZ+5Ad04ubmZHz3Hl5chOfWzcraCy2z/jyQW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUM4qgMagP/ZX52fhd6FdDpw0TQzsgZttAvHleCNV0dEGHCVUDwgZ+Lu1XFCDP/iiD4SL0LaOydFUdhZbyTQk1f7vRRw1jN7LwrhR+T7sYVvAYH96x5YattBj780zkFkO4VQQqAd6KanNnW3rnheckpPIWcrhvigHlljZtsroPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OevwW86j; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OevwW86j"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-346407b8c9aso628574f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 16:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714173573; x=1714778373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gcMe8guOHwR8NewzVOejSu+gPJAKchRWOcy6ZA+Pa8=;
        b=OevwW86jg/YfYf1fcGfiZszyTa4TrL4D1S228N/6XAXzrGb9x4Fb43zTQLuoKu9KnN
         IZwDS8EE9adNZopowu81mkiKWUuKnox7pEiDr8sQ5iIqThGwQr5IJPzgXm3y/49RMgBg
         9sc5Bg5Cofw3XMxDIi3QBP1AxH+0MeZcdVmUL143UC+q4jCjDueSXzGh51BxzR4m8QLj
         wTA1xkrywSc8Q/m4bsyyWE9xbV6jsGEqfIORws3pi5w4kEZ8gWFF7xLJ9bpNF1Vdx5KD
         dQm86ipdmXpk/NXQLI6OVQ0KRrj8Zlw362oksphBrzFZbxtK4K+elXayfTPhwGSrLlb9
         iUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714173573; x=1714778373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3gcMe8guOHwR8NewzVOejSu+gPJAKchRWOcy6ZA+Pa8=;
        b=UVa67S/PM71Ek8ejyEfoEyTd5IWGuwSA3/jkjjWwD9JzjWHMDUGEjFBWBFUMwv82Yf
         vmWX0fhTVHbX5XmxiMfRb2YayZwpaulSKXUDv1D6muf1riLcfuq7Jsau+yyn/mhggKP6
         fMiM1cabR5ARHTqQ/LZkvp0RC5yAgHQVxaQwxLp/dZjX8Wai8UjtML3/sBxWIcgnfpBw
         LB9YFwjUSwD2ViyrBUV+SR+tCBv+2QZtIs7+FQG0yv4bW0VuiTE0Y4jojzDxg0gKIBK/
         eI1F0pNu2KfYLTvLFzFn1BPZ1jOuR6ibKGosA074bHL5VxT5PQ/wYHA7Z2pkQO5JjeUs
         V10w==
X-Gm-Message-State: AOJu0YwLdt9+Gpx56jN2xbhcskcZBDGZFTr0sU/c3doItRAqe91bil6S
	zvKZHxwnMIkpJxErQQ/UL2GrryJ7p0SDazsrPhPazdJ7JPknsoPn
X-Google-Smtp-Source: AGHT+IFYrWsEG7mp3i8L9Dle+I47rFh1J8AExeG6zxBz0tiNFo/L65wAhoex7DwFPNgUU0UUFXVKcQ==
X-Received: by 2002:a05:600c:1d26:b0:41a:c04a:8021 with SMTP id l38-20020a05600c1d2600b0041ac04a8021mr2773551wms.0.1714173572315;
        Fri, 26 Apr 2024 16:19:32 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:d20e:7300:f1d3:7133:ba99:885d? ([2a01:4b00:d20e:7300:f1d3:7133:ba99:885d])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b0034c61e211a5sm2309300wrt.63.2024.04.26.16.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 16:19:31 -0700 (PDT)
Message-ID: <a9e30b43-cd34-42e6-8940-e79922234d06@gmail.com>
Date: Sat, 27 Apr 2024 00:19:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: kunit: use const qualifier for immutable data
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, tiwai@suse.de
Cc: linux-sound@vger.kernel.org, colin.i.king@gmail.com
References: <20240425233653.218434-1-o-takashi@sakamocchi.jp>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20240425233653.218434-1-o-takashi@sakamocchi.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/24 00:36, Takashi Sakamoto wrote:
> Some data for testing is immutable. In the case, the const qualifier is
> available for any loader to place it to read-only segment.
> 

Hi Takashi,

Thank you for sending this patch. It would be good if you add me and 
Jaroslav into the recipients list as well next time.

> Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test")

I'm not sure if the "Fixes" tag is applicable here, since this patch 
doesn't fix a bug.

Anyway,

Acked-by: Ivan Orlov <ivan.orlov0322@gmail.com>

> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>   sound/core/sound_kunit.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
> index e34c4317f5eb..165bd0f5338a 100644
> --- a/sound/core/sound_kunit.c
> +++ b/sound/core/sound_kunit.c
> @@ -45,7 +45,7 @@ struct avail_test_data {
>   	snd_pcm_uframes_t expected_avail;
>   };
>   
> -static struct snd_format_test_data valid_fmt[] = {
> +static const struct snd_format_test_data valid_fmt[] = {
>   	DEFINE_FORMAT(S8, 8, 8, -1, 1, SILENCE()),
>   	DEFINE_FORMAT(U8, 8, 8, -1, 0, SILENCE(0x80)),
>   	DEFINE_FORMAT(S16_LE, 16, 16, 1, 1, SILENCE()),
> @@ -154,7 +154,7 @@ static void test_format_endianness(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT_2), -EINVAL);
>   }
>   
> -static void _test_fill_silence(struct kunit *test, struct snd_format_test_data *data,
> +static void _test_fill_silence(struct kunit *test, const struct snd_format_test_data *data,
>   			       u8 *buffer, size_t samples_count)
>   {
>   	size_t sample_bytes = data->physical_bits >> 3;
> @@ -191,7 +191,7 @@ static snd_pcm_uframes_t calculate_boundary(snd_pcm_uframes_t buffer_size)
>   	return boundary;
>   }
>   
> -static struct avail_test_data p_avail_data[] = {
> +static const struct avail_test_data p_avail_data[] = {
>   	/* buf_size + hw_ptr < appl_ptr => avail = buf_size + hw_ptr - appl_ptr + boundary */
>   	{ 128, 1000, 1129, 1073741824UL - 1 },
>   	/*
> @@ -220,7 +220,7 @@ static void test_playback_avail(struct kunit *test)
>   	}
>   }
>   
> -static struct avail_test_data c_avail_data[] = {
> +static const struct avail_test_data c_avail_data[] = {
>   	/* hw_ptr - appl_ptr < 0 => avail = hw_ptr - appl_ptr + boundary */
>   	{ 128, 1000, 1001, 1073741824UL - 1 },
>   	/* standard case: avail = hw_ptr - appl_ptr */

-- 
Kind regards,
Ivan Orlov

