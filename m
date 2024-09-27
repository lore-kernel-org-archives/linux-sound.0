Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7153156864
	for <linux-sound@vger.kernel.org>; Fri, 27 Sep 2024 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433601; cv=none; b=mFtM0g9A2I4w8X6++adaqQEohm5++w05JEZpgyCmAMmM9NeQhVAtTP8x3nGDToRnvjVY5Xm0ajFLnwXfpP4UJUiWjYFoVfmxLCiN9H51+QM+2LexsI6qVgax0IqKJWS4mXU88WT91Squpz9qhQpXjxTRGv1EaUx51hLC0ktXGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433601; c=relaxed/simple;
	bh=9+fkWLoDVVQnsA5kctY001sTkq3UiJUqEpleEfgI8fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M8lKeUi1tT6a0H0tyz7oZoH4kyuqSPJZ4p2nsBDOge6rB9BfKSYAH9gqM1gZgedHZWmRNN2Fur/hACLd14fRjx6Auq0BvUckOj2qchpbbQEWns8dackHaIRrDakcClL8pLLH3l1DpswtMJwalrSC99NCIg8Hzsu3NHuXd/XuDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYLJvNBz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYLJvNBz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so12505365e9.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Sep 2024 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433598; x=1728038398; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHunu6izudDzf5mlXs43z8zqB7q52kkaxu2RvWkBiYc=;
        b=FYLJvNBzlfO2p9EWedIPmi7acNk3DOZfby7Pvnf2C7b8/MW6sg1sui7Ue8VocHk/9d
         SKq6Xxjk6tbr6Drijn5WAuxt9nrFgdKsrIcldGC2QesOFFr2EMgLyE25XKPWK2j6bsXO
         csSvK93eUgOGZj1FW2EwwQ//7M/3sh1Iobk9ahWfcMPSS3xcyvdr2lSDyy1Qj65dAtlA
         cOEo/p9+r01zjniK3i3d+JyWmAqTn4UvYlinkd955L0JjXwkE2QzIGjDWJtln+G1xYQh
         t+L3aAsroeXS7GY1yW6HXa7MT6LwHOMDkQHadXWxeMBl7Z8lvqTD0qhbloeoSypIKxCy
         pYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433598; x=1728038398;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHunu6izudDzf5mlXs43z8zqB7q52kkaxu2RvWkBiYc=;
        b=QUupQs1Y+z2PyGVPvHgpDVyR90AauJ2IZy4+0DvZPHlR/07GMj7DMiNbZtcH8GXrAW
         AkBzxF5l26wMVF5KZarwlFXB9Z4RCHy8qRgEO4Ky9+GHKYMcDxwkyqBfag/Eyr0MIMXo
         DmAWs8kO3mpjRNIpu5IAaW25Nhft+//zAoS3IYPrITgvV5AoE2a0wZ0Zr3/oGQFJ/Da7
         dyepwkZnNUht99l9Otogw2zyChpqVFvWJls+MbiFlVpFOe5jKRgm9PSL+RmexYUVC9Ip
         LaH8HJixhjGgpoknLkhveSJbCEoEBrQ0rCyRkvUzTRWsN9uIbyhHnFbqMFOL9q2hjv76
         lm6Q==
X-Gm-Message-State: AOJu0YycsWcbdZCj+IARgVeg68bEJMBIBwWax+AmiOdQAMvIS3Y838aX
	8SWkFReeXBD3hGw93WkSMaxQ1QsUc74u61cp+7CrFdezEoMQNpGdmqgM5lZFRPQ=
X-Google-Smtp-Source: AGHT+IGWH95GFoQAT+zptVDpU7IaDCday7dORNIh+U2AkzvUITmkW+B+zqK8LaaqkIQgH2dycVg97A==
X-Received: by 2002:a05:600c:1ca2:b0:42c:b68f:38fb with SMTP id 5b1f17b1804b1-42f57f7503bmr17813805e9.7.1727433598011;
        Fri, 27 Sep 2024 03:39:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730e9dsm2077872f8f.71.2024.09.27.03.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:39:57 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:39:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: amd: acp: refactor SoundWire machine driver code
Message-ID: <f7a1ddf3-b089-40ef-9518-a8cfd986b8fc@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Vijendar Mukunda,

Commit 6d8348ddc56e ("ASoC: amd: acp: refactor SoundWire machine
driver code") from Sep 13, 2024 (linux-next), leads to the following
Smatch static checker warning:

	sound/soc/amd/acp/acp-sdw-sof-mach.c:365 sof_card_dai_links_create()
	warn: inconsistent indenting

sound/soc/amd/acp/acp-sdw-sof-mach.c
    307 static int sof_card_dai_links_create(struct snd_soc_card *card)
    308 {
    309         struct device *dev = card->dev;
    310         struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
    311         int sdw_be_num = 0, dmic_num = 0;
    312         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
    313         struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
    314         struct snd_soc_codec_conf *codec_conf;
    315         struct asoc_sdw_endpoint *sof_ends;
    316         struct asoc_sdw_dailink *sof_dais;

Just declare these as:

	struct asoc_sdw_endpoint *sof_ends __free(kfree) = NULL;
	struct asoc_sdw_dailink *sof_dais __free(kfree) = NULL;

Then you can delete all the gotos.

    317         struct snd_soc_dai_link *dai_links;
    318         int num_devs = 0;
    319         int num_ends = 0;
    320         int num_links;
    321         int be_id = 0;
    322         int ret;
    323 
    324         ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
    325         if (ret < 0) {
    326                 dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
    327                 return ret;
    328         }
    329 
    330         /* One per DAI link, worst case is a DAI link for every endpoint */
    331         sof_dais = kcalloc(num_ends, sizeof(*sof_dais), GFP_KERNEL);
    332         if (!sof_dais)
    333                 return -ENOMEM;
    334 
    335         /* One per endpoint, ie. each DAI on each codec/amp */
    336         sof_ends = kcalloc(num_ends, sizeof(*sof_ends), GFP_KERNEL);
    337         if (!sof_ends) {
    338                 ret = -ENOMEM;
    339                 goto err_dai;
    340         }
    341 
    342         ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
    343         if (ret < 0)
    344                 goto err_end;
    345 
    346         sdw_be_num = ret;
    347 
    348         /* enable dmic */
    349         if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num)
    350                 dmic_num = 1;
    351 
    352         dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
    353 
    354         codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
    355         if (!codec_conf) {
    356                 ret = -ENOMEM;
    357                 goto err_end;
    358         }
    359 
    360         /* allocate BE dailinks */
    361         num_links = sdw_be_num + dmic_num;
    362         dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
    363         if (!dai_links) {
    364                 ret = -ENOMEM;
--> 365         goto err_end;

Missing tab.

    366         }
    367 
    368         card->codec_conf = codec_conf;
    369         card->num_configs = num_devs;
    370         card->dai_link = dai_links;
    371         card->num_links = num_links;
    372 
    373         /* SDW */
    374         if (sdw_be_num) {
    375                 ret = create_sdw_dailinks(card, &dai_links, &be_id,
    376                                           sof_dais, &codec_conf);
    377                 if (ret)
    378                         goto err_end;
    379         }
    380 
    381         /* dmic */
    382         if (dmic_num > 0) {
    383                 if (ctx->ignore_internal_dmic) {
    384                         dev_warn(dev, "Ignoring ACP DMIC\n");
    385                 } else {
    386                         ret = create_dmic_dailinks(card, &dai_links, &be_id);
    387                         if (ret)
    388                                 goto err_end;
    389                 }
    390         }
    391 
    392         WARN_ON(codec_conf != card->codec_conf + card->num_configs);
    393         WARN_ON(dai_links != card->dai_link + card->num_links);
    394 
    395 err_end:
    396         kfree(sof_ends);
    397 err_dai:
    398         kfree(sof_dais);
    399 
    400         return ret;
    401 }

regards,
dan carpenter
