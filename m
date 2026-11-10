Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304642;
	b=vo9z32m8U2M2XMMVYK8pL3fHX41EJBmZkrdzVVqQeJG4RizvxlUqgmil/M9I1e1A2PCu
	 +c9DOw1+iMQDBJSU5s0FsZAja43roPYWcjEIwJZnONHdMGlWnlo2kRpsgC9mB+ONg0gJg
	 ikB5yf6533pRHkLL/+b5o+/zL5LGLSe+AB8nqA7GxU1tqVnZY+j09T4fTz6p+s0EDPc8N
	 if4vMks38IONvc8lIjp08123FtIHjx2MeF6fQ0EqZ+Bsil+77Q+gXBMqOL9HtGmHERRHG
	 Jij4hu8FOZDOukhqyk2AwF4w12iFZ9xyI4n1OPNvCFH15mQ8ezSu1az5Xo/n9qWskHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tTHR38mY11B/5icwsExskzuyoZfY2wPwkj1B1V6Dev0=;
	b=luVPp4ljXKnSQsI40sgH2i9wCWdJSsL3RhNppej8f0Kk+G6gStXZczncb8WxTNo9zsfb
	 RplRU8+ywazrkUPIoUc6r5cb8UFuAq9vC4j2hFjBg0E0I0aFsa2/We+2VyqAvBqSekcOq
	 AHTTmC2AGIooEgXzC8ASJmKYfzyZ16WlZPe9VY29u8Z9fo0SBRMW544u2KoKYWGwKypEw
	 fazhWP7xPorQxVhIFccTDyE+sMdNtdrF9ksY58uvAJXw06kIt+SLiEDBGXGmP+crhKCKq
	 8uF6f5P/Cio8+8Vx2FAeqbx3AeJAtEz6bIWfC47+dgqpJuiE81rMhe0DYq5vjdHI0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFgJWNQR;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAFD606A913
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAFD606A913
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFgJWNQR
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so948538f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304640; x=1794909440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTHR38mY11B/5icwsExskzuyoZfY2wPwkj1B1V6Dev0=;
        b=vFgJWNQRpY00BTiiT2wohK496Dl7MoSkYIsP3zKGk4yjycuur59e6oLavf43ykes8u
         ToLxr0/upin1AoCisw5nZTRQ1xutanrTyJyY2sBbJvYCaBmf46He36lIDdz5sE8xmWxp
         Mi8KqptNWHLf82kxBk/xG75ofy8BvA+ZjjxUrpV4DGSPMKTyjVtJv6UI8ASO2Jag54Ok
         HEmjUIG25liwvNWd1/zC3wDgK5ViE2myFVFvkvHKg12U0wa+I2aCaQQboH1V8sXhlOUP
         eyVNvn8lqgsTM/4xmk+Alx3Xbhp3FdkDMaU9kixCSSCwLuGqyJ/wYcEFRNEo3i+tqvZb
         iEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304640; x=1794909440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tTHR38mY11B/5icwsExskzuyoZfY2wPwkj1B1V6Dev0=;
        b=0oUAfHlO1kTwfGxhAB3IrJWpX4x18sO44bI9wiJAsjAlM7N1885V8VoGMqRhsl8GJt
         LZxOp/w/RWt6/scsNK+/iwNRpCsHZ166Z0rch7Fq1q9Jc/B34d9JoCqcFbE407AFU/2i
         Ibmj5CtNgjh7b6MeCobw3TzvybAspPU5YwibvId8DKZjqP2XxhZzCCXDbC2fjVuxQbF9
         klpaNDxEXV2Dvd8ONUpbQnOkdevUBFm4yscV4mdRwDkyxTZrUsv+AHjqATc2yy0mDpUB
         aKAD8LxYiwd+G/0jYPGBQR/JlOavx6C8LCkXKUJYISmu+qgOIaKIm2YJvKspebSDCbOK
         FvPA==
X-Forwarded-Encrypted: i=1; AL+hErFgzowF8bd2wEiNh3QJDpJuYnKiX6kZkYyFsjqoB6RewYQ6JF6dtr9JbkfqJnShc5fsGCi1ze/9C0aAOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1F9iknMeWTrrm3dVG+Uvz5jPAYPRd6sQDn3JyaUEZuD9xX+Ha
	JXDFmqgSxvynshGV7Jyy/exMuZPLzGhlHnJs99Pyx/2Agab0/HcX0G6l
X-Gm-Gg: AYBFou2Qypn35LSkiMmVqElDNZFGmOakCvd2Q/OjVbP+dZ7GUXn3xBnbu5xTWR25HeC
	gw4VCNXBhgWyNSpjRYv+zYSI0QUWnXjBLzp9MOZ8tieFyZYI2eVnREIw0oQeoGrZ3mNKIRbZI0r
	kPd/Ei1CS8z05cG6iu1SH4hwVRGpfBLAlkHjX6BTJtY4KpJMhpuVhp5rVOi3AAJx0HaxeDladX1
	dGrMALF3asSvG6zzIVh0h7d4ZVFy0cCIS3AROaqiKR+TSIvM4JoNUhFi7crfUTZSmMvKZumvyfb
	AbONJCpzIfFh9UB4LFtE/RoqxodFn7LFAWWJNGALrzPM3a0tz/oEnzmi1m1LRK19v2CNOVC8xiy
	t8bRFnlQif43e+qlDu8AfE5wUJbi4gze7MVzk14sppqky6JuN5nwR1A5pSmTm6+SIDfpQnNvmTE
	VhFqYRFmLgm8Uw7o5mg0iqJL5fH3Yuubhz4CTvCkDX6XZS9AcxC9aiI7gOR0jDuLiidvtArQSAe
	fUxQ0MdQd25iPp6SiiB5w4ItIXGlgM4t+D6MmCi7Q8D/cDNIqdURKl7uOdHVSfcYtvm95vTjV09
	4uzRtZLJBKNw+4xyiSwFVi4Uu+zxYRNv/2qAySMZZfVNX0FqvVCf7s0vn4eVEg==
X-Received: by 2002:a05:6000:4b06:b0:495:5c83:51bc with SMTP id ffacd0b85a97d-4982d13022fmr3778167f8f.5.1794304639745;
        Tue, 10 Nov 2026 01:57:19 -0800 (PST)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm3841475f8f.29.2026.11.10.01.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:57:19 -0800 (PST)
Date: Tue, 10 Nov 2026 10:57:18 +0100
From: Jan Remes <ciakval@gmail.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: reset rtd->num_components after
 allocation
Message-ID: <avLqfsCe0eXV1hFe@mm-ntb-00805>
Mail-Followup-To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261109102536.357134-1-ghidoliemanuele@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109102536.357134-1-ghidoliemanuele@gmail.com>

On Mon, 09 Nov 2026 11:25:20 +0100, Emanuele Ghidoli wrote:
> Reset num_components after the allocation.

The same regression hits Intel SOF/HDA: on a ThinkPad E16 Gen3 (Arrow
Lake, Core Ultra 7 255H, Conexant SN6140) no internal card is registered
on v7.4-rc2, with

  skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route ...
  Analog Playback and Capture: fail to add hda routes, ret -19

This also looks like the regression reported for Meteor Lake here:
https://lore.kernel.org/all/mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me/

With this patch on top of v7.4-rc2 the card is registered again: the
topology loads, and speaker, mics and HDMI outputs are back, with no
warnings in the log.

Tested-by: Jan Remes <ciakval@gmail.com>

Best regards,
  Jan
