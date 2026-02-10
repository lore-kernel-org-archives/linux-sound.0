Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D04329E40
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713524; cv=none; b=AKEA4ZUauxwjvoPY8mjuCwoMMeDK8LmSjB5MTxG5N0DtbVY8oiL+1OZIMI14+zHAonPKJsu+rr92Z0fQokeeAp84wlRWngpIWhttBhshSZJUANHTcN5SS7xKYvirlZotqIpHyY2Y0el+vfaUaNW69wx9CPHG3pLr1FX0xdGQ+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713524; c=relaxed/simple;
	bh=6bxSCRQjKfdz1kx/1+7y+FWItuyvamgzcwltHnv3Oik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fdbSke5Ja9SDHrIEoGYmJZQ1PIMy4JBhPv6CAx8HUSWkn6voSKxJ4d1x7SxbyRo5CduPgZlbXu06d8/3CJd0HXtCqaIKWpwlcpe9OkirFQSR+wmB2mllMqAwHaDXYimE8eR4eA69DlfdJgx03a9ei2xcy1QYoDXUyYaduUzqiQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIIFZvRf; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIIFZvRf"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4833115090dso5360245e9.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 00:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770713521; x=1771318321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ggQrZbIS00PuyIC/VAAyPH4Kb3amYUqQ1eGorEAsp18=;
        b=LIIFZvRfBz32GWLTMFIRx4TjRIDezEDMdAbGnMVDxpHghqY6CHb6zFAYryETB9J87L
         wh3UipGMb2D8Zb4h9Sn4Nmp0i3hRSHfMdmf7a0lHMiTCfpHW9DPs99dICbH0OP/QeM8k
         7kJCtwyqCv9yNPuzO8yLj9SEooZAwksFT95T5GPujDpmOm57MQXmE2TkPl8MBbYITyUM
         FUCtfMGgdeuAJ7stN0VzRBL5fFmG0f2oWCwueDQWqVvw1Bo/bqkrjFBa4EDNNK4z7b48
         yBAkD3uOdiVOgqk5tl7OmiItuvfcfzc5adInSCTVPd5jkW6M0vMnFv6OfSKkwkFGZHzJ
         4rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713521; x=1771318321;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggQrZbIS00PuyIC/VAAyPH4Kb3amYUqQ1eGorEAsp18=;
        b=tJ3pEbo73OY7cw942D5ubsRiGeHLF6fRr9rBG/IRuO8NRY/wvhZs5dBtPmNymlr1R3
         aTTLxwNDldG8smBQsGvrRznYQ4Ac9kmk+8NqtylfVcTi6WuEuEXS0TkbTBCrvFKRl9UQ
         pgTSFEG2LxjLxj3MTxmJyOMZkiu/zN2pFW6FNrvzKDAlJrNgc5MUdNn0GSj2KDf/K6ph
         jCojlbba5xJyrgnu0o9lMb/jPluYx/rfC7lHCpet1FTfmQtjZSTPHouC9GDRRKY9AHrJ
         rDp/wRcz5Of13Gz/yo21UE3En/clU6PTSlGi76FdHgp42Jem9jT77BivYp0Fr5xq6pvG
         GU1A==
X-Forwarded-Encrypted: i=1; AJvYcCU3iAXauWZJeLDGAxJlyeaixGDz5o0VFfZe0dxPaJ7P3i0MlnbiZUsflOzh0bjyB6vMAowcwRL3vANOrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2MJyxry7dK6Q/NjhWPUFzpxog+m9aEa6/W20vugygCItWMt1
	Uhw+iOUCs39TwNsT3B+Y0kqI6QjQBPPLu+PQs5schLrlXv2VC+1TWs2wIFzfTREpkY4=
X-Gm-Gg: AZuq6aLVmqNbTaY090xY9rafUgqJPNMU1MJfLQsP3O0eTJUdkzZZtcjs5sjZDfO/yMJ
	Wcq6y04yWMm9i3Ioa+549wCoT0hVSGEp6bxxJE3ZSlIJoYJeKiZ6I50wdTjvpSamjJcJvxofvEW
	/OtHTsUAcBuDCnekwgSC9/TXENM1a7vGv8CaxBVyjn4Kk6RkFZqurmb4+rcsXUwZMAu5iBFJWsr
	43UOD04AS+u09JzJAPMG1oO8hu250nOysMeyVV9l0GQPQT+FZJT7N6v4a9toaJB7hV46v/PWuzV
	FSM2Psxm5FxVR9j+cnrmbKbn5/NbqC9z2daYPkKDP9kMBpOSas7EdtTl4oPpb4CMkDvA1JXFH75
	iQR7iWgJtb5hWQOURdJAU3xKN9NO90DO2dRdvPNOcwcZlW4srhk57ZQf2tcxTrIo4oFK1Z+6p4/
	csiweMBBm4Ke+nPpZcvcbXQ9HSI9MY
X-Received: by 2002:a05:600c:3e19:b0:483:5310:dc43 with SMTP id 5b1f17b1804b1-4835310ddedmr8808095e9.32.1770713520986;
        Tue, 10 Feb 2026 00:52:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2ed9sm33056703f8f.5.2026.02.10.00.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:52:00 -0800 (PST)
Date: Tue, 10 Feb 2026 11:51:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] ASoC: SOF: sof-audio: Add support for loopback capture
Message-ID: <aYrxrYG3ZSGDfpn6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding. #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Ranjani Sridharan,

Commit c4b37c21c75d ("ASoC: SOF: sof-audio: Add support for loopback
capture") from Feb 4, 2026 (linux-next), leads to the following
Smatch static checker warning:

	sound/soc/sof/sof-audio.c:534 sof_prepare_widgets_in_path()
	error: uninitialized symbol 'widget_ops'.

sound/soc/sof/sof-audio.c
    478 static int
    479 sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
    480                             struct snd_pcm_hw_params *fe_params,
    481                             struct snd_sof_platform_stream_params *platform_params,
    482                             struct snd_pcm_hw_params *pipeline_params, int dir,
    483                             struct snd_soc_dapm_widget_list *list)
    484 {
    485         const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
    486         struct snd_sof_widget *swidget = widget->dobj.private;
    487         const struct sof_ipc_tplg_widget_ops *widget_ops;
    488         struct snd_soc_dapm_path *p;
    489         int ret;
    490 
    491         if (is_virtual_widget(sdev, widget, __func__))
    492                 return 0;
    493 
    494         if (!swidget)
    495                 goto sink_prepare;
                        ^^^^^^^^^^^^^^^^^
widget_ops is uninitialized.

    496 
    497         widget_ops = tplg_ops ? tplg_ops->widget : NULL;
    498         if (!widget_ops)
    499                 return 0;
    500 
    501         if (swidget->spipe && swidget->spipe->direction_valid &&
    502             !sof_widget_in_same_direction(swidget, dir))
    503                 return 0;
    504 
    505         /* skip widgets already prepared or aggregated DAI widgets*/
    506         if (!widget_ops[widget->id].ipc_prepare || swidget->prepared ||
    507             is_aggregated_dai(swidget))
    508                 goto sink_prepare;
    509 
    510         /* prepare the source widget */
    511         ret = widget_ops[widget->id].ipc_prepare(swidget, fe_params, platform_params,
    512                                              pipeline_params, dir);
    513         if (ret < 0) {
    514                 dev_err(sdev->dev, "failed to prepare widget %s\n", widget->name);
    515                 return ret;
    516         }
    517 
    518         swidget->prepared = true;
    519 
    520 sink_prepare:
    521         /* prepare all widgets in the sink paths */
    522         snd_soc_dapm_widget_for_each_sink_path(widget, p) {
    523                 if (!widget_in_list(list, p->sink))
    524                         continue;
    525 
    526                 if (!p->walking && p->sink->dobj.private) {
    527                         p->walking = true;
    528                         ret = sof_prepare_widgets_in_path(sdev, p->sink,  fe_params,
    529                                                           platform_params, pipeline_params, dir,
    530                                                           list);
    531                         p->walking = false;
    532                         if (ret < 0) {
    533                                 /* unprepare the source widget */
--> 534                                 if (widget_ops[widget->id].ipc_unprepare &&
    535                                     swidget && swidget->prepared && swidget->use_count == 0) {

We need to check that swidget is non-NULL first before checking
widget_ops[widget->id].ipc_unprepare, otherwise widget_ops is
uninitialized and it leads to a crash.

Wait, the zero day bot already reported this on Jan 5th.
https://lore.kernel.org/all/202512232221.Ub3HwrFz-lkp@intel.com/

    536                                         widget_ops[widget->id].ipc_unprepare(swidget);
    537                                         swidget->prepared = false;
    538                                 }
    539                                 return ret;
    540                         }
    541                 }
    542         }
    543 
    544         return 0;
    545 }

regards,
dan carpenter
