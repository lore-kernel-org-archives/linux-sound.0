Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C51448F6
	for <linux-sound@vger.kernel.org>; Fri, 19 Jul 2024 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721406200; cv=none; b=ExkAmDGiJGDkhz/9G4bTd7wasI7F1z9FqmVTM3zoccloIlbPTHhLhk/dIACVhwmXk/WO2RRh+97nH0PzcBIl3wvkgGA+mUIgLgUYJ27raOaPAdrmiW3DkMYeg5NekF3a4DEkMR8cFbXwPlSXb7RYUv9pX2HPYtiGnjLFx5Wzt00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721406200; c=relaxed/simple;
	bh=/uoCW7etoicGPbRjZI4F3TMdO2LKe6DBsQClBEQEVcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1UEOJAwsxFL+sxrv/+x/RtAo9KIVcmpI5xTvLPIIfdin2HVsGM8JQBptor4tV5YjvgIpouuWNrNg0Oi51APMJTYKH/N6JmkUdOJlUDK6LTfpbicr/uFnNTgOppTwwuvop2AP4m+bLR7VqpzNsP5ua3LrfYq+NjFNr0pduzPLEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB6Md7Yq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB6Md7Yq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2cb682fb0cdso1151058a91.3
        for <linux-sound@vger.kernel.org>; Fri, 19 Jul 2024 09:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721406199; x=1722010999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/uoCW7etoicGPbRjZI4F3TMdO2LKe6DBsQClBEQEVcA=;
        b=gB6Md7YqIqM6BqSulSESbcYTHBUgWuWx0BTMW06oPoMkHDacx0g95khQXuakPC9lef
         1Nzec7Qpvmy2389+hzaqVhxEt44jbQZmTdv9XAnoGOMNE5zQvBSYOcbe/FK+opM9Jva/
         x8w9bcnH4B0jT4iZ2rqIT91dyC+2NlcXfInDDa5luc9eCOt3j+huiDI9K0PnWafGTDYP
         XyPFdnAF8vtGRO4e5L6v35ZmqLdfvFN+jk+W0WjlZHom3oPisUuiUBZgzbhDJfCDXbvX
         KsrHfpN+KB8W3rxsXpMSBZUcl9oiJE3TAhGARX1AhZgevfzJ87FqB8/Q3vdkIVx8AgRr
         MWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721406199; x=1722010999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uoCW7etoicGPbRjZI4F3TMdO2LKe6DBsQClBEQEVcA=;
        b=YpMN2stDwWe2rxyT/uqGMRvxn0Jc2QjcpG6IuEZR3JgjdbEhtnwJBElsJHXpXxOv/T
         Yy533XpLIkpQaTRzRg3dvjLGBveI5dQ5sVYbtDhpRlwfU/lfvEvHpDZUv6I9Rf3Kx2zQ
         aVeUzXliZ4h2V+52cREsR9PXqKx54g/epcKtIwyx2vLCpdJ64YZlx3vLYtuAcTY43Q2C
         3o1ZAebxrHohitsrh7AWxvCl0l+z9f0fQ5Xgr0hYZFu7UqKrbp7v8SiFS/SLOu/8cmH5
         x3QrG+zaFt1GQgL0J+HO9Er6qBskCMIEWmlBRxfEudEg5IQvaODteMDuEBKEw1Yp9QML
         Aw9A==
X-Gm-Message-State: AOJu0YyPT+c75Bz5DNKWy/IicXduPGzMUiibbdLlHdvHqI2cIUAL2LFr
	G5icVcfy4nrpqbcfV6X/E9xZ29r6f1h5htpwM8G7dzApcd5xhaGHz5+hZSYj0fBzScbKUZy7uaX
	TpT1riFhFVAFlQ7+ihiJzWHQTQpY=
X-Google-Smtp-Source: AGHT+IHa3qJGUfhNNEhWiokPkTxQ6FU8lkdLdFIkn7MYhdmho8lxi8QfxyffaCIOgMzTtvEtUA+NqB+S00jywhjTL/s=
X-Received: by 2002:a17:90a:6882:b0:2c9:8f14:c02e with SMTP id
 98e67ed59e1d1-2cb5243161dmr7130054a91.1.1721406198804; Fri, 19 Jul 2024
 09:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625155217.18767-1-tiwai@suse.de>
In-Reply-To: <20240625155217.18767-1-tiwai@suse.de>
From: Rauty <rautyrauty@gmail.com>
Date: Fri, 19 Jul 2024 19:22:41 +0300
Message-ID: <CAGpJQTFMiR3qSWOwwi8Wmridr08Rs7m=LErLbQo8790JrOHs9A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix conflicting quirk for PCI SSID 17aa:3820
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Zihao Wang <wzhd@ustc.edu>, 
	Gergo Koteles <soyer@irl.hu>
Content-Type: text/plain; charset="UTF-8"

I checked, the microphone is working
