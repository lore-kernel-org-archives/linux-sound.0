Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B7420E89
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380497; cv=none; b=l7dWIbmMR6vUDBA7Gi46PfFBnv7febTEuhQXodZtqEhhiqsux5GAeJ/jzntURxFBFX7nZJdCRffi6po6R1+oKc073Tn2rp+JInMs0z9eFDRSYhuNlLU0aysC4g32BYTpLGKUhqaXH3rfMv3ZGoXTdfusorZo69TouWYsDKEZNLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380497; c=relaxed/simple;
	bh=wvewqGspSF0+0tZaFegnTfyHBoPaVXNrprOpdgsXmQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dy409sYgvjvHwaw5rSisUPxV1hnbpWzwObCnec7l9nvFTu3FpH89KAT48Wk66JZDJd0MXK1ogw9La7cEfdvwaVPVwJJpKlt5vPJGmHGF90F1jkIge3unXXlhvr2aAG/SeWu5sjb4Ac+QWx2yaPwp9FPA2VFDOFcJXY4kE2R1pZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpGYoKYz; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpGYoKYz"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so268122366b.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789380494; x=1789985294; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90eu+2xkgHrn1KJtJWAnnYeVGWcd1Cy8bHOHpijrO40=;
        b=VpGYoKYzn8fDpD4wPyz7c6dI6KaqvEcRofqezbEz/vSX+2PpaFXnQP3dcZWEBUDKcw
         OkZ/PvcPhIcpvQlrIRS/MUpWCpH+K9ao7fZbySmIt1WrH5Ws9HuGbGi80Jsjqvh588vX
         BuzIdKBaaYvWclFofDO3BtYZZZzQ+gOj25XlUpCzuYFGtuCeuFRVnNq0qebeBzZCc2jq
         1EJBWj6gBCsAxybzAJumr2ifj6OwrfnWMWp2RUXueeJeB9TXUm3CWSxqaAKZ8jzilgfB
         E3C46z6881BumEZ2uOH/SuG+sRQurXNduiYqpa6I6NIsN8naW9qiyYu21weLH1s+fOCT
         I/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380494; x=1789985294;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90eu+2xkgHrn1KJtJWAnnYeVGWcd1Cy8bHOHpijrO40=;
        b=pKZChrLDS4fr9jFotuec+u5d2Y27w4M+SaBbK3EbNWP730nAMWQ3P1zFK5I+Q/qvpI
         sVvhWvk5v50ZolRkmW1tRhYPQeJ0vDkIH/gGPVZ+CQHn585Bg/RPOx5FbyYtsx8OcJtD
         M04DCO6uPjp+X42BLaE7WUndvoEujcoWZYsBYJk2dYOW+iJolVSUTp774GpnPBURDLXM
         YreEXmIv3RJoT2KVr7HrlVx3YU+tqtnebiZazG4Yuvc+KJH5u/B/HxzKfuLTr5atSx6H
         c0TSVh/YZEEF9S+do6naAVF+3XXUkEo65nYHji+b5/uFpn7g1GSZga5ThjtTaTKeC9Pw
         IZHA==
X-Gm-Message-State: AFuF++klnIzrQZR2NviqFGB4skdGkQbaVD+/YaT5pUpZcTC2Db4tgGVU
	AqHUa0F62ED28ctPTye7/AG9vFofK8HYQaXoa3BvmZ+STgknrcOHuy6f
X-Gm-Gg: AYBFou2M/IOf8y3iWFTGBlNgS3q8NcI9f6/lV1tH/aKTWk0pb/gv872hggYvsyfv46v
	J0/E+yDKzmJkM0mae/JoIX1U48hbTHdwF/du7JY6G0VFItjIOJ7+cXecbA/157QLHY3t8dc2Np7
	BsKv29QSQo8uArbX8bqdfK+LTSLCHh5rKVSz3UQmcahjKLTZw7Yq1lISwJF2qyPUW4BOCdgPQR0
	dYF3DTlJaGICP+mnOgs7vkLdxsYmqLyM6QrnVJc8rXeTR2wwhGgFoWWYeWqsFSAPhDzUUZHjtGQ
	WEy9VMsrdz3eXA+9Gm8Sg61ZidZIwg7drQ3AiD9KgfBcMNTGALwlFlWJ23h9cvjsLFnJru+PIgV
	LamAwq4S2HYuvRM3YD1alxKcKuqZP/Xes1XotadhV/izfD2Tc0iHpS4ze0Cp0c/QUi+R1g2TdF2
	ccGti2l/cX6gJtJIQumZkl6kqS6w+XuJceufd/P7Iw2sO82kd0MIoSdsnsPFgvLQQj6O4=
X-Received: by 2002:a17:907:1c1e:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c29b84ded72mr120670766b.6.1789380493888;
        Mon, 14 Sep 2026 03:08:13 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm4080441a12.24.2026.09.14.03.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:08:13 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:08:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: bui duc phuc <phucduc.bui@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: codecs: pcm6240: Use guard() for mutex locks
Message-ID: <aqfHiX3pE-0BiCt9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello bui duc phuc,

Commit f3da3b7f6ed2 ("ASoC: codecs: pcm6240: Use guard() for mutex
locks") from Jul 21, 2026 (linux-next), leads to the following Smatch
static checker warning:

	sound/soc/codecs/pcm6240.c:623 pcmdev_get_volsw()
	warn: missing error code? 'ret'

sound/soc/codecs/pcm6240.c
    594 static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
    595         struct snd_ctl_elem_value *ucontrol, int vol_ctrl_type)
    596 {
    597         struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
    598         struct pcmdevice_priv *pcm_dev =
    599                 snd_soc_component_get_drvdata(component);
    600         struct pcmdevice_mixer_control *mc =
    601                 (struct pcmdevice_mixer_control *)kcontrol->private_value;
    602         int max = mc->max, ret;
    603         unsigned int mask = BIT(fls(max)) - 1;
    604         unsigned int dev_no = mc->dev_no;
    605         unsigned int shift = mc->shift;
    606         unsigned int reg = mc->reg;
    607         unsigned int val;
    608 
    609         guard(mutex)(&pcm_dev->codec_lock);
    610 
    611         if (pcm_dev->chip_id == PCM1690) {
    612                 ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
    613                         &val);
    614                 if (ret) {
    615                         dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
    616                                 __func__, ret);
    617                         return ret;
    618                 }
    619                 val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
    620                 /* Set to wide-range mode, before using vol ctrl. */
    621                 if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
    622                         ucontrol->value.integer.value[0] = -25500;
--> 623                         return ret;

This was intentional, but it would be better to "return 0;" here.

    624                 }
    625                 /* Set to fine mode, before using fine vol ctrl. */
    626                 if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
    627                         ucontrol->value.integer.value[0] = -12750;
    628                         return ret;

Same here.

    629                 }
    630         }
    631 
    632         ret = pcmdev_dev_read(pcm_dev, dev_no, reg, &val);
    633         if (ret) {
    634                 dev_err(pcm_dev->dev, "%s: read err=%d\n",
    635                         __func__, ret);
    636                 return ret;
    637         }
    638 
    639         val = (val >> shift) & mask;
    640         val = (val > max) ? max : val;
    641         val = mc->invert ? max - val : val;
    642         ucontrol->value.integer.value[0] = val;
    643 
    644         return ret;

And here.

    645 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
