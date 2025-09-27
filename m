Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C2B824A3
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758973806; cv=none; b=FQi3WTraj7wbUz7LvCTFjFwThaC50V0xWJAhl1NcmCM2HuBeZolajbLCLbLHjv9l1jTZ9wNBQqj1kljJOBBZ0zDqwCGsaT22xof3/QfrSE34ud/R7I555BQKEHy3h5w7I5jEyilDIFJ1FLOZh5oXhh5vohx7VZS8KvMB+njnWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758973806; c=relaxed/simple;
	bh=FmkW6fv9RvYho7jnssoOwnojufdPnMJ7bpOkOZiiS6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bS4xc6vQxofosAa6JtAlTQncZmdksK7Szd6GekTyrSNieDTaFEHjdVQAaMPu1/54Jfm+Px7tSiTqVg8siEmQQatp2IFWtY9Kpj2orH04XTQhvyOkEOUqqa6KoNMxuVn7xJj5KjyM6oWWrGLwLf1z5144ykI7FNSPR1AGWegqJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv6/hsqh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv6/hsqh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-78118e163e5so1092459b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758973804; x=1759578604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7M1fiQxbluyhtXAEzIDiPynOcFnwYfQj1hrp68Zys4=;
        b=Mv6/hsqhdT6Nu1dqWfChlCBxV0fVLSz/ZAqVL1Nx3LloPk4pB2lGZl5Ys1e7SVSfnb
         3ZbKNj0f7XGYwFXmW3FspDEPlnVM++6Gm0Y3mn+agVCBLw2Q68gEhbqNvkrN9doxrB9a
         QXa9MxiqNxpSqeuWiBsw5JreobuTVz8RGNS9+tEbpIJ/LlIR55vPKR2A2Aik4/b4ERg0
         B4AZgNOuy8QKbSCqDvZOQ593Qx34vFlRTiIbNynUr4Cjm4wh+KAuxA4oH3ydd+2BQOFd
         Pe8IYNhiDUTwip0VHsiCmQq1axzXGAItS++P3EUQshcHslWk8Zrkbx36GP9iyCe0HaPX
         x2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758973804; x=1759578604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7M1fiQxbluyhtXAEzIDiPynOcFnwYfQj1hrp68Zys4=;
        b=e3fIwQCss76M2LD35mPlakNrK+tnuvt7FDCasYOnWLV8wfHQ1IS55E6gspr1uu3KKQ
         1s36LclfMrbn8+hWeR+AD13HI6YL6/+9jeqCaGSrU54el3LWloaPjmZfnb2DhDbb+iwD
         qvOLMgTRwMzHwuBjX2jKtIcBQBtYp8cArVi9jvbF45GvQJ0gcWH/n2pnc6ubQklbrM3N
         byr/f4Azs4Fiwyf37BMYM6LkpLVfnohqknCdbk+M/JReQYgNbxnqIjt9Sfq71wGZcTYP
         aDAZojoGF4BrYwjfwYtyrG18ze8K2/KtmWlBrkoRuXZvwZCr/I7MYnmVY8NGqLD8hI2t
         FVUg==
X-Gm-Message-State: AOJu0Yz1pRunI71PupLh1Mw2Gi5c7o7tRkgvLN3gfdcb2COsitDrtn3L
	FEB9f4u2/apOLx9pm5KxdCZB1YqIrUtS8we3fT3XU0dPyHJgFuJ1O+/L
X-Gm-Gg: ASbGncvZDo0Sabvk2hF3n1PY1nJ4SLmejnuSf2kS9e2FbJRflcJxgi70KgdhVXZy+wo
	Uhg7kgnk59eM4M7aiseQVh6FBClqETPpnH4uA7zOWx+DrB8fnQiYZAfCsowbBndiTJQEzNPJYwV
	nxFX8nlYOI36nqvDwtr/3c760efAK4VqnX9KBJDjPxPTn5yHqa1j7xLQfDwTjfJjVGmcZZLh9HD
	1yMYrR01rDEtgFQ2ZhoFMo/ZT/MCrC2FBBTPZGTF2Rfus5CqdjpbMs3Xg4Mj4Rsl1Ni5bv09W9N
	wUYYFa5jwfeZD1uej0AvZR1t9XLnxl2q43GzHhRNbeWpQ5b+M5Zc+7c/rqS+MD0bG1lfTS3NKAr
	1zxrs7m3Eg6K75sUu1R8qVw8ZCVKj6e7WEKcs
X-Google-Smtp-Source: AGHT+IGFQQkVyfRAsja2DHyE7zdSWxG/uinaLDtYMUS0qEz0ZEbGJbyQ57SNOzxvZ0pMKKDRNkNKFw==
X-Received: by 2002:a05:6a21:9998:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-2e9a37cf926mr10870653637.9.1758973804185;
        Sat, 27 Sep 2025 04:50:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239596dsm6489628b3a.9.2025.09.27.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 04:50:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A37464220596; Sat, 27 Sep 2025 18:50:00 +0700 (WIB)
Date: Sat, 27 Sep 2025 18:50:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sound: describe 'chan_map' member in snd_dec_opus
Message-ID: <aNfPaO12834FMIBv@archie.me>
References: <20250926162658.989479-1-kriish.sharma2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250926162658.989479-1-kriish.sharma2006@gmail.com>

On Fri, Sep 26, 2025 at 04:26:58PM +0000, Kriish Sharma wrote:
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index faf4fa911f7f..e90e2f40732a 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -336,16 +336,14 @@ struct snd_dec_ape {
>   * @mapping_family: Order and meaning of output channels. Only values 0 and 1
>   * are expected; values 2..255 are not recommended for playback.
>   *
> - * Optional channel mapping table. Describes mapping of opus streams to decoded
> - * channels.
> - * @struct snd_dec_opus_ch_map
> - *	@stream_count: Number of streams encoded in each Ogg packet.
> - *	@coupled_count: Number of streams whose decoders are used for two
> - *		channels.
> - *	@channel_map: describes which decoded channel to be used for each one.
> - *		See RFC doc for details.
> - *		This supports only mapping families 0 and 1, therefore max
> - *		number of channels is 8.
> + * @chan_map: Optional channel mapping table. Describes mapping of opus streams
> + *            to decoded channels. Fields:
> + *              - @stream_count: Number of streams encoded in each Ogg packet.
> + *              - @coupled_count: Number of streams whose decoders are used
> + *                                for two channels.
> + *              - @channel_map: Which decoded channel to be used for each one.
> + *                              Supports only mapping families 0 and 1,
> + *                              max number of channels is 8.
>   *
>   * These options were extracted from RFC7845 Section 5.
>   */
 
kernel-doc also supports documenting nested structs in this case:

---- >8 ----
diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index e90e2f40732a0d..6398a253add5fb 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -337,13 +337,13 @@ struct snd_dec_ape {
  * are expected; values 2..255 are not recommended for playback.
  *
  * @chan_map: Optional channel mapping table. Describes mapping of opus streams
- *            to decoded channels. Fields:
- *              - @stream_count: Number of streams encoded in each Ogg packet.
- *              - @coupled_count: Number of streams whose decoders are used
- *                                for two channels.
- *              - @channel_map: Which decoded channel to be used for each one.
- *                              Supports only mapping families 0 and 1,
- *                              max number of channels is 8.
+ *            to decoded channels.
+ * @chan_map.stream_count: Number of streams encoded in each Ogg packet.
+ * @chan_map.coupled_count: Number of streams whose decoders are used
+ *                          for two channels.
+ * @chan_map.channel_map: Which decoded channel to be used for each one.
+ *                        Supports only mapping families 0 and 1,
+ *                        max number of channels is 8.
  *
  * These options were extracted from RFC7845 Section 5.
  */

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
