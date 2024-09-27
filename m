Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804313698F
	for <linux-sound@vger.kernel.org>; Fri, 27 Sep 2024 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433336; cv=none; b=niNcR5QbMokWqyQ1wYnzBOxBu2sqRWGs157/Nlv6YTxQDbZ/rUxFeCbaLHedh6nYipWZ7Amf3eUfx88TdSqmaGtBOsd+vY2p4BRxqJcoThQONrg19CehMSRJKDdGI1HgAB6Otn7c0yNH94WwkH4Q7AvWTqiydPi6oHn2d/gzo2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433336; c=relaxed/simple;
	bh=Wxt/3e1njcEgSynaY7vrC7RVWmt/xme89q+KGle4IqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtNZAmez1KaqEzeWQrhd9ewjo8ViOFW1h4USTganTrm5cEAZ7mGVL/WMAhhGhrDHxiYeBzO+jJ9IgkgPm2CpkBYBp0VRj/zm68GE95wyGmj51523Jfyt7R9wGKoE7vlXwyU4X9cxX3snRAcC1zMiUlZ78jClp7M1NzKE/5ksASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J38D7BER; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J38D7BER"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so18144595e9.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Sep 2024 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433333; x=1728038133; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFKyxqXcaFs2fiQTe1oQz5gEF8BC4tAaPCXT6gZT/94=;
        b=J38D7BERv6EPTpbSs226RmNjwdWEHAcDCdCKSurNRm2QsgGZV85HF4SddwjP8yNUM+
         rkvh40BCEGGiau5cCZrOl+4+70baL8ES0Q1/OP1ne3ZOaviQtX5lDkzU5M/M7zia77mQ
         nrvd/Gy1rFLvs915nD+8cYsNQYH1HNG6kvBLsEJi4yytin94WxJJyLLaS5pjX1uJIg3u
         pmxGxkJ/BXvkyPLfn3G675V12Bcqav9OQBdzNJc8iNwDnl3Jd9b0pyJqZGjAuGFTI7pJ
         +ZCyKKXlfXDliOxqI4GNWtfTOm3w2tqv84jE8muob/nIAbp3Ppii2aHKxuwHdx8cdPfD
         BX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433333; x=1728038133;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFKyxqXcaFs2fiQTe1oQz5gEF8BC4tAaPCXT6gZT/94=;
        b=RIVH99bmnIrJuYaX9CwDTEhYjLCgdQMsW3LDyKlucFJ7IbZFqHuYMoqohkDu55Gpe6
         W9LkzutYU8lwfJR8upAL67eAdKPeY+BOVrP/rm4SmdtywzKP9fX0fmKQ8aIKFTPjcB2J
         tOI/uAV/+tNOZDUnDqVpBHZljHIPHiUYUXdOKO+RpBbg0teJvSlTKuol32efFLDXxIS0
         +h3tXZkYsGabFdQVHBx4Yg/qCIrtEBKai1DjrYI0oRHpNLymrFy+F58zhXBj7VO0gdmI
         Zbyvfk/Cvfvw2w7G2TjxqdXNoTvy3C5/9m0SXUB02oM9QOQ4FYgckMNYZiXtExhSkp6f
         7Xsw==
X-Gm-Message-State: AOJu0Yx2ucG1sYAmqDiFFvwXvINdtaymkraHCoc1fkNhqbxzYd8Khhbj
	ESrsDjhauxsR26cuqxPaSH0jXLjMHjVWGSYj1wZh4mhsLldWd9xNAhle6cJUUZ4=
X-Google-Smtp-Source: AGHT+IGwYOXN1T3aHKJCwb1QxchxEBWA669n5P1WHVECaH941ZHzkIKUg2UmFUE/yuMXV9RMVsyT5w==
X-Received: by 2002:a05:600c:a42:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-42f5840a6b8mr21474525e9.7.1727433332651;
        Fri, 27 Sep 2024 03:35:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d33dsm2123875f8f.19.2024.09.27.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:35:31 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:35:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: amd: acp: refactor SoundWire machine driver code
Message-ID: <d245bb1f-27ee-4a7f-a5be-6b2573bc2c8a@stanley.mountain>
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

	sound/soc/amd/acp/acp-sdw-sof-mach.c:157 create_sdw_dailink()
	warn: iterator 'i' not incremented

sound/soc/amd/acp/acp-sdw-sof-mach.c
    144         for_each_pcm_streams(stream) {
    145                 static const char * const sdw_stream_name[] = {
    146                         "SDW%d-PIN%d-PLAYBACK",
    147                         "SDW%d-PIN%d-CAPTURE",
    148                         "SDW%d-PIN%d-PLAYBACK-%s",
    149                         "SDW%d-PIN%d-CAPTURE-%s",
    150                 };
    151                 struct snd_soc_dai_link_ch_map *codec_maps;
    152                 struct snd_soc_dai_link_component *codecs;
    153                 struct snd_soc_dai_link_component *cpus;
    154                 int num_cpus = hweight32(sof_dai->link_mask[stream]);
    155                 int num_codecs = sof_dai->num_devs[stream];
    156                 int playback, capture;
--> 157                 int i = 0, j = 0;
    158                 char *name;
    159 
    160                 if (!sof_dai->num_devs[stream])
    161                         continue;
    162 
    163                 sof_end = list_first_entry(&sof_dai->endpoints,
    164                                            struct asoc_sdw_endpoint, list);
    165 
    166                 *be_id = sof_end->dai_info->dailink[stream];
    167                 if (*be_id < 0) {
    168                         dev_err(dev, "Invalid dailink id %d\n", *be_id);
    169                         return -EINVAL;
    170                 }
    171 
    172                 switch (amd_ctx->acp_rev) {
    173                 case ACP63_PCI_REV:
    174                         ret = get_acp63_cpu_pin_id(ffs(sof_end->link_mask - 1),
    175                                                    *be_id, &cpu_pin_id, dev);
    176                         if (ret)
    177                                 return ret;
    178                         break;
    179                 default:
    180                         return -EINVAL;
    181                 }
    182                 /* create stream name according to first link id */
    183                 if (ctx->append_dai_type) {
    184                         name = devm_kasprintf(dev, GFP_KERNEL,
    185                                               sdw_stream_name[stream + 2],
    186                                               ffs(sof_end->link_mask) - 1,
    187                                               cpu_pin_id,
    188                                               type_strings[sof_end->dai_info->dai_type]);
    189                 } else {
    190                         name = devm_kasprintf(dev, GFP_KERNEL,
    191                                               sdw_stream_name[stream],
    192                                               ffs(sof_end->link_mask) - 1,
    193                                               cpu_pin_id);
    194                 }
    195                 if (!name)
    196                         return -ENOMEM;
    197 
    198                 cpus = devm_kcalloc(dev, num_cpus, sizeof(*cpus), GFP_KERNEL);
    199                 if (!cpus)
    200                         return -ENOMEM;
    201 
    202                 codecs = devm_kcalloc(dev, num_codecs, sizeof(*codecs), GFP_KERNEL);
    203                 if (!codecs)
    204                         return -ENOMEM;
    205 
    206                 codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
    207                 if (!codec_maps)
    208                         return -ENOMEM;
    209 
    210                 list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
    211                         if (!sof_end->dai_info->direction[stream])
    212                                 continue;
    213 
    214                         int link_num = ffs(sof_end->link_mask) - 1;
    215 
    216                         cpus[i].dai_name = devm_kasprintf(dev, GFP_KERNEL,

i is always zero so this just sets the first element over and over.

    217                                                           "SDW%d Pin%d",
    218                                                           link_num, cpu_pin_id);
    219                         dev_dbg(dev, "cpu[%d].dai_name:%s\n", i, cpus[i].dai_name);
    220                         if (!cpus[i].dai_name)
    221                                 return -ENOMEM;
    222 
    223                         codec_maps[j].cpu = i;
    224                         codec_maps[j].codec = j;
    225 
    226                         codecs[j].name = sof_end->codec_name;
    227                         codecs[j].dai_name = sof_end->dai_info->dai_name;
    228                         j++;
    229                 }
    230 
    231                 WARN_ON(j != num_codecs);
    232 
    233                 playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
    234                 capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
    235 
    236                 asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
    237                                        cpus, num_cpus, platform_component,
    238                                        ARRAY_SIZE(platform_component), codecs, num_codecs,
    239                                        asoc_sdw_rtd_init, &sdw_ops);
    240 
    241                 /*
    242                  * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
    243                  * based on wait_for_completion(), tag them as 'nonatomic'.
    244                  */
    245                 (*dai_links)->nonatomic = true;
    246                 (*dai_links)->ch_maps = codec_maps;
    247 
    248                 list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
    249                         if (sof_end->dai_info->init)
    250                                 sof_end->dai_info->init(card, *dai_links,
    251                                                         sof_end->codec_info,
    252                                                         playback);
    253                 }
    254 
    255                 (*dai_links)++;
    256         }
    257 
    258         return 0;
    259 }

regards,
dan carpenter
