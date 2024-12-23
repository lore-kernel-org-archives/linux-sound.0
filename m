Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685C77462;
	Mon, 23 Dec 2024 22:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734994487; cv=none; b=LMvKo3JskixJy7OAZTv3/L8zFDZZWjvYkGGYvYmocZ7pCQRLqYsqp2qFAXhuee3sqtQxSjZnld/ls8yi4z01P1itTyK71UnUhDPmzDM7JWBd+vDTsddUl3K+hvtIfNbmt0Bih1uzwEVno8CqeDsi2fCCm5e+PirkKzjUR4Wh8V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734994487; c=relaxed/simple;
	bh=ClxIXP5NHI13CxkHHmzxTyW1jPeGPA2zkANS5JKRv+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzkYWCBw4V/r03OZ1WGwwva9veXMH5cQN/ft4vmbEsoEVRIOnEcBJJ8dDQrgjlsTqSg+//RADv9aYD5vOKi7dT6UyukbUJV0imOpvpTw1xfBJq33t9sTpijLw1sIxOdfJanWOXizG+7wbkg/K8qY64W0u+q3nxA9RGQq5yBqPC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO18xder; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO18xder"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361f796586so49620335e9.3;
        Mon, 23 Dec 2024 14:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734994484; x=1735599284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO1xEZbP9g/Uk0i2EJuhNeVvMUt0RSMhNuU/maAKUJw=;
        b=OO18xderaPsRAb3vrm+1IGHXNDgRMXitydRnQT5nQB9bKatmlxhUROTOIPBr6RAecT
         Gj7ZQxY3NCnM4uj2tlIXqLQ/EXCl5EtmIYQdaHKH5P4AQo3wRIw8bakpvcDEQyhVXhVI
         5M5KfnQbCGh5DrjGqa5mzwnC5I8ZZgIcMWNGPPccIQ5wkEAyx+wRrPAhXQ46Y/4myrwH
         rj//D7oXxaBVck4RXuzT5Bs3/Tm0F7Gtv72+HIJhCH51secmHaszP9OOkcS8gGCG6enk
         yW6HGgGUJGv8JWQncucJkDVJ+P9ekIwK60+2ASIKHzSrsbkIf1FmmqQwuntyLFH8ij9N
         cDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734994484; x=1735599284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO1xEZbP9g/Uk0i2EJuhNeVvMUt0RSMhNuU/maAKUJw=;
        b=FrITPeyCrY9sJzPbE+wPqhrvUk9Eaq4qt8NNkWfG4N9hP3n2EibkSjWEwOfElfM0q9
         CxpbpSBl7WiouCHW91XnP0QYS/a6YPB0T09+uCqSWFgv/peUVFxvYWW9dUn7PwBiRO2i
         g5ImOg9KTVgnf2W4fUrn6Ejiv56txMiS5s6j9dP6XlLXZIAZDLxUEg2lMVBGRAFm3J6r
         TwBxsfTjHQJY4j0ed9VqoRnSgVmBTtyu5zfwn7COFzy96GQTzWZjooRVFk6Mn7VpQD6H
         EpGTm1mGcggjZqYXoK+hNuCaDnoD+MAxV24LutfVKlM1zLMnC6GbqRWZddbf0Yy+HALL
         xshg==
X-Forwarded-Encrypted: i=1; AJvYcCUUstjIGOMih7LQu5Al5VGRtFQhS9IyJgGVVbFioNjGeZb0VEQWwHdG7z+B0I9LNwBgsaahi4HfGAfQExk=@vger.kernel.org, AJvYcCW2j9eIU4D1rcG+Qs4T4mYEZtL/Mk+Pz112q7aLKz0apq02RQVrzDmpjEerRoAJBQrNsDrXql5lhJ3Jq20=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBWH9EJUf6kOEubGJeEpM/TpJkWRIcCvPaSsCpcn3Mmz1go4hf
	1YbK1embqDjf5edmX3oZRrls5VMxfo75Ps0CZF4TXog6hY+/Gm3F
X-Gm-Gg: ASbGncvAp0Ht7Ly06oTpPCS8rTpaCdATp41i4VfUpMeJGBc5ZvA8NOGOT5TgBHcs5XY
	q+AUpwSe6F021B8zKmTC/KPHwUH/R+4I41ijAAl7cn4TubseWC1sfk9daJAu4GTaaT9Ko6nXFWd
	ukJ71S7ahEwoi4QmeGZUsdQHungmhI48QjFbmOcuV9fzox9cYXsKJmdp53dsOx6YwsL0unV04B1
	5AH3ddp6hZt5O6J+kpctJevcnW5hJI3iZ/hq3fzI+mKPcWIN1F99QD0e5eTCPCuGC2FJZKH13ns
	owQ=
X-Google-Smtp-Source: AGHT+IF25eYI+7NBNe+4co3f52zpGKUlULVCIKnmRA22DVK1/aq4nXsgytJE2KVJPpvN6hO+lJC9iQ==
X-Received: by 2002:a05:600c:468d:b0:434:a802:e9a6 with SMTP id 5b1f17b1804b1-4366835c192mr111886125e9.7.1734994483404;
        Mon, 23 Dec 2024 14:54:43 -0800 (PST)
Received: from localhost.localdomain ([188.74.74.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219578sm150624455e9.20.2024.12.23.14.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 14:54:43 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: tiwai@suse.de
Cc: 13916275206@139.com,
	andriy.shevchenko@linux.intel.com,
	antheas.dk@gmail.com,
	baojun.xu@ti.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	liam.r.girdwood@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	navada@ti.com,
	perex@perex.cz,
	philm@manjaro.org,
	robh+dt@kernel.org,
	shenghao-ding@ti.com,
	v-hampiholi@ti.com,
	v-po@ti.com,
	yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH v6] ALSA: hda/tas2781: Add speaker id check for ASUS projects
Date: Mon, 23 Dec 2024 22:54:40 +0000
Message-ID: <20241223225442.1358491-1-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <87v7wajunp.wl-tiwai@suse.de>
References: <87v7wajunp.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is causing issues with the TAS2563 in my Yoga 7 Gen 7 (14ARB7):

```
[    7.264012] tas2781-hda i2c-INT8866:00: Failed to get SUBSYS ID.
[    7.264065] tas2781-hda i2c-INT8866:00: read acpi error, ret: -61
[    7.264109] tas2781-hda i2c-INT8866:00: error -ENODATA: Platform
not supported
[    7.264252] tas2781-hda i2c-INT8866:00: probe with driver
tas2781-hda failed with error -61
```
