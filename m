Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF58F39989D
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780018; cv=none; b=Rv5bHvyBxgzFJihB311a+cIGvsZ7VKxalwReems20My/6yKNR5yzu7UMdMHER60eXyrpnqZjxKMDHW5uzm+hqaCFF60v7k4xcgTXc6+RP2+n1lwSGp/d/sxXF1LbAQrHA1buhdwJg9p+pjuyLwLxwjTsBdhblnm2CH2NjvgR218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780018; c=relaxed/simple;
	bh=kYoJ9Kf/Oh+1bSkgWeHDR3juCfPfjWN/kyhOf5M46mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMcdalZfz3dwZk/IsIPdK8gR9TkhahelGh5Xr+fvC5JOlQJkdQBjqdtLeIypvzKgcUYdHQVVOLN7oOxBEw1HS5qF3wFMwVBe1Cf/YiID7Nbt40yx7EtLh0nnmaYXjfoY7qNgFecBcUBWZeLl1FFAvfzkE+GHKL4JdPNW8bL3gW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xj2woxZF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj2woxZF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ac357c55so6945115e9.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780015; x=1782384815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RkWuiKvVeZCHgBuI0UqL+PSzvFxmanvxxnQKqHnympo=;
        b=Xj2woxZF8PQTIxKuPbO3JQU1+f1Et609kW8yvEWqTcFalVQ7e76R6SlmAD1Y4qgYzZ
         yiVcvPm0f4xGMSyOawy87oSa0UkgXyay68bcFgW1D0RbA3gc3a+h0llVHwpR4by+FYaA
         WFIkEql6uc2jYdjw4MOImrwjKQ0mk5tSc4mqTAjx7tYzJVPOTt/YzjpmfH/yrDW2myhW
         eT5f4FRo/qoeL2bBvDJrq8imptwBee0HltZaJf/ZKWM64Ceo/xvnEjCxDZ0SN0hNyg8d
         wE7soSmHFwHLv/4JFkl4qYbQT3PyhMjWvMUAX2OZN08G/Yot9lZ4WTk5IeaV66V7WXxP
         Bm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780015; x=1782384815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkWuiKvVeZCHgBuI0UqL+PSzvFxmanvxxnQKqHnympo=;
        b=ZfZEhObyRhUU87kIlNzpUWl46DPf1LG8bEl5icnl8WK46jGM+QM4ProMChPzm6R94m
         jeYPHSvCc09XMe5M3sK3ewlnoVzhR0fwK13n0wL6hEY5yfLmXSUzMq5vZD6RQpHvx9jK
         Obe3EZiOIzRKca2P3j6ZF6OXBaZ3oKhpQh+ycq6kMkmLLNMmuZbvXsrBBeTZzxaMvrZG
         JxlMdVXhq3O78plfTsoRlq8hLu6fBNicl3cG9dpmCDpbxafGglRESkZP3qan4zpC1P0M
         UAAhACv+b9T0E9myTfEUzLLchdnaZwVqQqb+who5GniGnDzvc3JQRb91CaLQYYZe15Ks
         bgkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PAfUKl6QacHZm/NG+h2S47SZ0/ORpXnH+yfQ99/Lx804xF249HfKDBU98JEYvs6KbLJXp78HpDSiBfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDlVYyqZFVlsRyjtBK7UsP7Axko1qq4+WsxJgL2Mvgw9S69ZPe
	fPO+ILfSCm6e9u2mnFIUHV55crSPzTFILnsgXMaSGE0fGYwt1cycftZG
X-Gm-Gg: AfdE7ckzIM8zhy5asLXjp2UhCxwwzM8UyKjFrlpdNBiST7wZ5MvuTMhd7j7k8DCm2J+
	wdiItBzLV8V7K6IMPuMlhfxx+v/VISQRJNyYp3g6bhgw6fun0m11xsC9gCzV9j4F1Pfa37UXbbm
	uZ8BclhfXBy/ksEpuq74JLZRCNhOQSQl+2Q/d0LW52rFl8vDYhXQs90QYHnO0zAlwZZmuOGlxvF
	4Xo2USuPE2tD4DpIkbnTAGgl4Z47gXQNYTTi7rf+aFchn5V4qbSISD8M0sbcRZbSDUACai4AlCt
	Et5hq0t3DT8O4bkkwD7io6UmR84WScLtQqAq2fzrBCwSRzMq6rADIL89/cqOvBNjNDagYEKoNT1
	IGHsxPVtWU2Vv/uht8JjD/glo0ohBL6O/2a9wLmOeaGYSGlCGm4ffgXdPD2sRz8Moip9b4PH3xF
	RrZU6kb3F5y1k5/IwOFX3B8d0u08VkQmrfr6pJNcWowtusCwUpQIbKcJ+29MfLASr9c6swQYYVF
	oEiR68=
X-Received: by 2002:a05:600c:608d:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-492333a1556mr152314225e9.1.1781780015080;
        Thu, 18 Jun 2026 03:53:35 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c473bsm67004910f8f.28.2026.06.18.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:53:34 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f6b5a124-63c7-41ba-b268-ff6e76cfe57e@gmail.com>
Date: Thu, 18 Jun 2026 11:53:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] ALSA: usb: Add support for Reloop Jockey 3 DJ
 controllers
To: Frank van de Pol <fvdpol@gmail.com>, tiwai@suse.de, perex@perex.cz
Cc: ramiserifpersia@gmail.com, rmxpzlb@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260617203937.1273852-1-fvdpol@gmail.com>
 <20260617203937.1273852-2-fvdpol@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260617203937.1273852-2-fvdpol@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Frank,

On 6/17/26 21:39, Frank van de Pol wrote:

> +source "sound/usb/jockey3/Kconfig"
>  
>  endif	# SND_USB
>  
> diff --git a/sound/usb/Makefile b/sound/usb/Makefile
> index e62794a87e73..1f045c00dbc9 100644
> --- a/sound/usb/Makefile
> +++ b/sound/usb/Makefile
> @@ -37,3 +37,4 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
>  
>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
> +obj-$(CONFIG_SND_USB_JOCKEY3) += jockey3/
> diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
> new file mode 100644
> index 000000000000..a1ac80f04450
> --- /dev/null
> +++ b/sound/usb/jockey3/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config SND_USB_JOCKEY3
> +	tristate "Reloop Jockey 3 support"
> +	default m
> +	depends on SND_USB && USB
> +	select SND_PCM
> +	select SND_RAWMIDI

The dependency on SND_USB is unnecessary here, since the:
'source "sound/usb/jockey3/Kconfig"'
is already inside of an 'if SND_USB' so every config option in that file
depends on SND_USB.

- Julian Braha
