Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EAA1DF261
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945200; cv=none; b=cHTEBS0RWskm4bHZoFedHY5SowBgT4ZaJJBQlXU2d535NvmHnQXbzYN9+Y//dnEj68qJ3/BXIAWgoG+UmIDGZehvfx9NM8+NgSuihmD0LEFFokCWcbMW87xVOA8jMusCBqaGMDdoYJS76vbEW8MKZLqT+Oga4aFj2iWpgxuFNcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945200; c=relaxed/simple;
	bh=O7ydUqHNqWs8ulaIT1DdEjlzkcf4n1baXKduDlh8JiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHn/FUmaSbq5vylHClOgqjjQgFHL0SGzutCAn5Ykcs7iBbq1hPeOhOkpwuNyXumqbnfanyzfl3ktQdz1cN5as2GL6ZOPDMhKSh3FS7N3qeRQTRjQZVGyYW7+LlKnV3j0nURfmKmLSUJ6WclQLXLm33Mpdc1WztxGwzpQydUd3EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADj6RRG0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADj6RRG0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so3211386a91.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741945198; x=1742549998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4pVKUCm82euY9GUbePkPgNOLEqV09kEaVxzvYVmv3Q=;
        b=ADj6RRG0nUgHb2Mk0O5vVjI/2DFXfGg5GsHtXsFYjMKdXvhEf6X3348seykM+UCbF9
         Yhaxu68Ct/3S8xG6X//egLj7FycEXyBhHPk/67vCgtqTIRssxSItfixBRgUswtuQ31U2
         KU8LF0SO4w41bqt6585JWQwyOPlxqSMwgOanNyxDlw445Xtzg+DiQgMNMYL7wcpKEwWi
         KyWHOFEku2goWC2UhuiCsU3dXQACgFt7Bi1iTuu+aQC96sJ3gyPGkp3FoVb3kPWce/i/
         Bhn7i4djjA3BLoiBvELUfvvNTqQSy5yjvBodVQuxC080LTEaXlAWFK3/5rh4cgPHiWmV
         zdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945198; x=1742549998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4pVKUCm82euY9GUbePkPgNOLEqV09kEaVxzvYVmv3Q=;
        b=ECVczAqmj+jYPKdKiGqX4nUcyR+/5AR9JGtjN72nXVpWoubQMc8g4R2CWR2hRUS7kG
         pilne/lNSS8aCru/KoZcP5fWrtZaFNesE6LVckG0r/5MteK3zGstFMd/l3arIG3I+Fd2
         5XB7sugj62zHjwpqXoU7oRF+2ivx7n+rZLcwA1PO+xo7qPrYFG5IMJH5E6uCcbtJT1Pu
         CztD7xdFO42MfpUNU7IWf0l7IrnCSW0nQjQ4rWnCIr9+7Z+7Cpou8UaagZrdnT6Fiqhg
         8/OxFkibCAU7SOP76IW1EewWy+3ovqCMylnU/MVjOUtpMuPXbj7sQ/HEV7r540+/y4eH
         7ZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUj8UTILQ9TyVoWwbxkbTpJrv2KiybCpuA+n3RIEdntok2K3Iea+6wE6jGPHoQPB5FcGDMkYhFWxQf6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBh4TCiXFPF4vXD79tCv+XxST7zV3DvMYfK+sQw2QgQKBTwRZk
	+0I+RAkOggjSRgwcRW0krn7lpJeOKfY3VBYqsz/VXlDykOFLmueg
X-Gm-Gg: ASbGncvORQS/RK+d8P8GF+UWrk3KieF32w68ECdehXK4iMA3mfMH8KGyTyC7H4uExGG
	KHi/E3on9CmcVs2ofhvd4tqXxz0hE2M4pZRky3bECcUOjRbTptx8pIM/AKZfJhGJ3j4xl9BEykk
	uz0BBBqU/nlf9l+0/O1uZ6YbTQdNKWoH9CmnYMJM0XOgVE+D+XyoKol4I4Bc/qSOkobpInpH3a2
	CEpE0YBfSgmwlJaOoQY9HuKW4PJgkyI2g1jEs+3x0yY/zlZlVSamcfdbn3zdVlI0SxI9Gg9B0Th
	+ont6eppqsL55R0YlnpmgbrfXXZgkpGR
X-Google-Smtp-Source: AGHT+IH1jm2sP0TbKMpsePwy/8RwXwuHjNsjCo/t8L8jbZ8nxv9Ir1lDwLmH5NQNEljYVqhV4Jm2Tw==
X-Received: by 2002:a17:90b:180d:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-30151c59cfbmr2684171a91.2.1741945198195;
        Fri, 14 Mar 2025 02:39:58 -0700 (PDT)
Received: from geday ([2804:7f2:800b:94c1::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afeba1sm644712a91.26.2025.03.14.02.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:39:57 -0700 (PDT)
Date: Fri, 14 Mar 2025 06:39:53 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/89] ASoC: Convert to modern PM macros
Message-ID: <Z9P5aSIKsp1WWmGy@geday>
References: <20250313174139.29942-1-tiwai@suse.de>
 <Z9PUmk5vJvu3FRdm@geday>
 <877c4s9ffb.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c4s9ffb.wl-tiwai@suse.de>

On Fri, Mar 14, 2025 at 09:36:56AM +0100, Takashi Iwai wrote:
> I can resubmit with typo fixes if needed.  Otherwise, as ASoC patches
> are merged via Mark's tree (then through mine), Mark would have to
> correct at applying, instead.
> 
> 
> thanks,
> 
> Takashi

Got it, thanks. Then it's up to Mark to decide how to handle the typo.
I hold no objections if he decides to take them as-is, but I doubt
very much that he will :)

Thanks,
Geraldo Nascimento
