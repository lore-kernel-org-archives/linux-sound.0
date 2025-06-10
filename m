Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4DB235062
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579873; cv=none; b=LtYPWfcTLxF3rcIIbOayWWsUlLerdy84fJryDLDLJh9iqfyl35sust3CUhQE5v5goqSJ/TEIKgfQ0relQrdnMFltibgiqL5hJjvxYBwtW/rx1YhJlfkazC9QOvUKCUrcjKGVH4dfAjFdUWiP7hwfZ7hlVgpaqIyAVAQdfL1EJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579873; c=relaxed/simple;
	bh=sD0+jWcWj1cmPA9v0uGPUmjcPj/TYs7nmp29Qur/TNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmK93W9eovldAUvVbmESFwNSQPv4UTJAOsYBpj8Y2EbR8xEPCuuHxVul8c+UL+9AMXCfEyG33Qfe48LPuPnBNhW3VNoCb+LcqcqzM83cG3W28qCbGDDeE5vfBabK6MO5PDEqX096854mOtNOBLVwGMTI5sHS1cd4AFkfnLTx2t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2yb74Wo; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2yb74Wo"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87ecd70679cso1934949241.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749579871; x=1750184671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5OR86WXtJlmPNFlKGzNp6AS6Xl1F7AuncDjOXG/9s8=;
        b=K2yb74WokGiO6alUrqSNkeOYz5MRO1N0tmyKNQaFPYwXMx5aYTH7KE5GBP8s9AZRzh
         dYNvbEq35xy6yHBoyGwtWnvuq7tt3PY8qv6ElfjSe86sCs4qPqFqT0WzzchiZP459l+8
         XHSvu8VGLagcCSt336MzLBjRM1YRfW/xhtwoEf0fkRGqiZhvYgCEoED3Gi9krrPXHNzN
         VpvMHLFIKaUrzjS01pze1BF70YdL8U3hWGmZE3Mb7fvp9IH3raZrQ/3Dtpvjt5gw3YWz
         UoBW28Y8SqK+jklVRJeaV4nhM9yH6o2z5CM9UNSmw4SbVD5VOez6mZIzq4vaobsNeMCX
         wDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749579871; x=1750184671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5OR86WXtJlmPNFlKGzNp6AS6Xl1F7AuncDjOXG/9s8=;
        b=AB2iczApnP/azAtRRDjt2pEz96OB7JUYalLtOHYgvAK2X+L9m8LD8mdH3yONhNYKZV
         aNIsS+uddtnDYaJ/BYy4PoBLm+VPvgqIqanAH/RyAq5KBp1dM778vqrlqw184NNvpRoD
         8Tghmf5GyovQb0v971eMwXxNZ+e9dnwrgKZLJltICKA6DwK8Nfv02qRQP9EjX73TRPjT
         O6q3/7I7jJOjQqUJgwxk2xDFEBod5CaZm2MrrJlcnzp2+e+aGvAL6QVeHOED4fSjYWy+
         M++cUh/uNk8Y3sc4QKTADnfjfVHvP7+8cLqK9UvmuVZUWHiCcbjgCr5JVofLoZSISkTN
         ruBw==
X-Forwarded-Encrypted: i=1; AJvYcCXdrnKbu68nRY0b8ohNyeVz4w/GDSm5/HsnZhX/ompLTScsr/zWvsONWurNbUavTsOJxy2H3Oq9hEEQFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAPqh+xlTKNIvzEOSv8EW133za3vhO4g0Z3Nql81xNRmAJQ/18
	i18XkGn37DqU+fO9xh+AYQHVSzf27KXzqTMNKZXKJXchbBR3yJBjaSTi
X-Gm-Gg: ASbGncs/b2WOdLM9B/pYgH8WrWj3qNCThKf+1FnP1bEjXdzETkG8UNSG3e93B6orbii
	klrggXeffzXWMAJ+ilaXxsMoMbKw8rasRxg/tmNgcaeY7W+HEMtJbDv1iXTpAa01jqNS7sFmv2F
	Y/WvY+fvnZxUJ9C03s6ogXtoPjKyZvp9FvCdt7KIpJeRiiz5M560B34N2aHPVp7P0RrOxw/jHG3
	ZV1rQSMDcRmyYULCCWVP3SvqbZh2xhqOf2rCajH1SK/6OgsfQuDAYvnW0DnletHu6hzjVVWttRd
	ZcQCljK+9g3+uZ9UvAuo6ZtxJVRPbw83gPDbsu2Jcxe/N0ub0w==
X-Google-Smtp-Source: AGHT+IGBZDLSAqF3B7DkkAhTuoFpP+yYyrs+PHGGvli6xSfM/sJpcMOFWkHX3SSmFMuqXVUxVxzqZg==
X-Received: by 2002:a05:6122:511a:10b0:531:188b:c199 with SMTP id 71dfb90a1353d-5312211dc12mr451148e0c.5.1749579871283;
        Tue, 10 Jun 2025 11:24:31 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5a56::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113c0d850sm1774566e0c.35.2025.06.10.11.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 11:24:30 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:24:26 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Cc: tiwai@suse.de, perex@perex.cz, linux-sound@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 0/2] Regarding recent patches
Message-ID: <aEh4WvURfXKjFSBx@geday>
References: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>

On Tue, Jun 10, 2025 at 07:50:10PM +0200, Lucy Thrun wrote:
> Hello Takashi,
> 
> Thank you for the response to my last patches.
> I've created them in response to the kernel test warnings.
> I apologise for the left out description, while I have experience with git,
> I'm new to using it via email submission and must have not realised after getting home from work.
> I hope the following patches are suiting your requirements better.
> 
> Regards,
> A Linux enthusiast trying to get their soundcard to work without having to deal with dkms after every distro hop,
> Lucy Thrun

Hi Lucy,

I know I speak for Takashi when I say no worries, thank you and welcome!

But I'd add: Welcome, to the free software maintenance burden nightmare,
where git is always ready to bite you.

:)

Regards,
Geraldo Nascimento
