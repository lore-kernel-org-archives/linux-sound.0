Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D853830C621
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422071; cv=none; b=FN7bvibYhxQBqYKC+FgaczJGFiGcFke59cDrAovHzgt89Mim7UvVUqwea+aMbbDS0tOX+3+wQStPneWHaWaw7gnZF/8E9BnsyTgtW4zJpCkcjI4P9h1AQ8kzRn4+CMqNTny5YEbxfsHN2lKBy3nbKsretIvsi2G0P5CgyN67q98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422071; c=relaxed/simple;
	bh=RKJbS+3Og1qBZgNICKzI7bLri5edv7amSAm4JK5iL44=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=X/IREedaelL1aRq6LCP0IaxGjvgT52PeRPk/buNzHw1xC53Y/mxGZ2fQrpuJ3hY4H2yLtj06elNA4QTzhFyhdwvfhG3m0ehrgQp5+WwTQajIwWZ8zVr1NR7FzZxRqPgkYnhsLjQkhiaAyC4bpTwVjJ0QoSqLIfjmLx1IwLO1tn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5EsMDxD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5EsMDxD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47755a7652eso5461265e9.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 01:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762422068; x=1763026868; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKJbS+3Og1qBZgNICKzI7bLri5edv7amSAm4JK5iL44=;
        b=e5EsMDxDROfFj7UL/LncIzUA3+J/nWnCLVlJe72koYYD/9GjGXkmQqy6FM3RqF0uXi
         +NdZ1Jr/Znzg+zurhKIkPAqgwDsJ7mNXm67jH82vtk7AZ3cB+r9j+xGqEdZASlGStkGI
         4rPz5frJKOP0xHyAJxT9hRIBJR87EvWKFkw30xqt+N1xi3uBEgktj5ywWVOQA3trP7Os
         3AqCH91YLeTdRlNTgqqq4253cXVAeUQbB6aBdJnMT9+PmURBkOH2O8iuVmpXceyU+XEi
         krsyc86AbmqEJnIQHdjK41mxEzu5UdL7cQMeWY4ZY1I21p6XS4wQ3M+sL8CUrj2vFJIn
         au7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762422068; x=1763026868;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKJbS+3Og1qBZgNICKzI7bLri5edv7amSAm4JK5iL44=;
        b=npsZFSFvMYUwsZv9v5EWvQZiDG9gZzCcirNKaphn32ZsDJvFFil6bz46iM7PD/MisZ
         +LJqAn8E8wAnHybIqoKokmtkaIpVFfJN5BytIISpL69kSsnkRA/ROZZZXWuN+1QerB1T
         wL6q/0iozu0z0zmnN8zk0LHfw/TAbQQXbgeZzvwVdEYqqPKOQQBTMEswlgUPQHvn1Jor
         PtfxnrUhqX7LgpRzV7RPumiFzeciKWrs8u/wkdftlgNqFPKz3iXtIj2BKOsZ9X8isuQr
         MqST1yfrUJDbCJewVv7LIuKqEcTde09FCEf6U2fwUp8cE+zPaC6rsGq1/6HfZzI85ECP
         ixWA==
X-Forwarded-Encrypted: i=1; AJvYcCUrkoblFpyHJsJrn5BVw5gaNOmTINbYrK8BKBpN/+/aK4v7OdwCJkMC6ba4Z9POsI3p2tzYdjipyBpSZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kYSBs30JFVzorpfy6uq7kwQ9YAm8DoxUYWAolVac9JGe4/0j
	C3POktfeZ+naKf9IGIjC0DQPe/xLsMdZDWo0Gvuc7QXCIVq+vKwQbUfz
X-Gm-Gg: ASbGncu+Ch6J4QF80koeWgnVK2cxfdMngVWlsM+b6aEy/u+ef/ehGtUMN3/YPLPEwTh
	HHnNNgeH8t2Kwu5Nir7v0637gv/H7Lb5Bgg4Z3jdR1VX6n9q+Zx3patpDPstz2UQZ8Zqm9e4FaE
	Dq9BDgngGpiglOFPZ5muy9FSpQ5ywOGUpGfENiMZ3f4kuNNBtBG1r8wibqrEnzKO8yyxVBAoUwo
	+e2RV9N4quPSjSasRcnH6c4ovD5OKSuTnY4J8X5VszV9YfuW2sSm6+imF6v/H2RR2VW3xRhjMq3
	BFnuJg98O40qoJjtVHrypZMj9ikhUYslJaPxX7CEUc12KcvOU9taeMP+1oooVWQ/w55F9J6pKQm
	NDdlqiRTMcIRNLPTq/MTIpGFmk9/yo7uw8RjeS+AmoUDSo15xZUmI0+7Tggefg73VhuD+Zcbf40
	2vhIr6
X-Google-Smtp-Source: AGHT+IF21ozos7qDutZAt/g/NvKo+hXW9YgEZlmxLNCbCy/dsSjMoZqB47HL5w20yrKmfk7J5t7S6Q==
X-Received: by 2002:a05:600c:474f:b0:477:59f0:5b61 with SMTP id 5b1f17b1804b1-4775cdf455bmr64248505e9.2.1762422067762;
        Thu, 06 Nov 2025 01:41:07 -0800 (PST)
Received: from [172.23.94.183] ([136.226.168.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ef2d58c2sm1990984f8f.16.2025.11.06.01.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 01:41:07 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Thu, 6 Nov 2025 15:10:33 +0530 (IST)
To: Mark Brown <broonie@kernel.org>, hariconscious@gmail.com
cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
    yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
    daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, 
    pierre-louis.bossart@linux.dev, shuah@kernel.org, perex@perex.cz, 
    tiwai@suse.com, sound-open-firmware@alsa-project.org, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound/soc/sof:Use kmalloc_array instead of kmalloc
In-Reply-To: <fad32f5c-f9a4-4cf2-9082-845deff309ea@sirena.org.uk>
Message-ID: <9e808d38-c720-fd59-8bc1-d1da6255c59b@gmail.com>
References: <20250923142513.11005-1-hariconscious@gmail.com> <fad32f5c-f9a4-4cf2-9082-845deff309ea@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 15 Oct 2025, Mark Brown wrote:

> On Tue, Sep 23, 2025 at 07:55:13PM +0530, hariconscious@gmail.com wrote:
> > From: HariKrishna Sagala <hariconscious@gmail.com>
> >
> > Documentation/process/deprecated.rst recommends to avoid the use of
> > kmalloc with dynamic size calculations due to the risk of them
> > overflowing. This could lead to values wrapping around and a
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
>
Just reminding for an opportunity to check this patch.
Thank you.
