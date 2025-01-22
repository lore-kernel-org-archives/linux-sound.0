Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD32045B2;
	Wed, 22 Jan 2025 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534598; cv=none; b=WthprlJo7UKRdETYlKP4P+1Yvyz+9YXTNHmI7AcGkam0YO4geDcpd9Txit8rp5zYGDvuadNPSf3Odlvq5RO3S7eLGUNJNsQwBAwiRdPPOCqFuJUQflYeI8PtoX7FT/4kWeSh4+AmVohH4xqpsEc9KLuCryuR5HE3IOh+7V4RlsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534598; c=relaxed/simple;
	bh=/tX+7Fy5cSnRoh3SFvELyGyWWn+cpGdNsJCXpeseT9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnhQoDqlwrg4k1HdxcgyoTpd+oKcfSYxFIHdlKmDjH3QLfUikgce9JAVlRmg02UE2e8q4Gf/F1wqZU6bQNV3waUvjbtXl8rLqYYiGUhh9Etk+vkGAsLLo3pqQ1cVH6sp527nkvAURfgrFDAzbypeqllVLM5x/f4v8P7dUIXP/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcU4Ymmb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcU4Ymmb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8687849a91.3;
        Wed, 22 Jan 2025 00:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737534597; x=1738139397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tX+7Fy5cSnRoh3SFvELyGyWWn+cpGdNsJCXpeseT9w=;
        b=jcU4Ymmb4CxlSjqCPffaUYcqdBPM/mFmXoLdmoIi5OtivwmZDVoHWMpdauqBK/bi+b
         NXwjWgyRAocpvpKm5jSIbx9niBG5WBf9cvw8GKhz3mUfWOD4czvOb/YHEyTnEC8UIYkY
         oFzz1slGEHw7dygj43hcLk5QeCXgIVZdQE7x57T310LYqPm6Ml6ckGtsA5sOgcjqrSPd
         LUzR8uFEAP8u7f56gRHffFo02yVbCdFTbWQgRlqXBQBitmTHVf3+vTddbTJHPtMZmeXd
         fWDNHgk6eio6yJ7g1JAIOddJh7Bp90qNfnCO2wqsowQEjfsYBrAehWrYtXsWzbNlYgM0
         7GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737534597; x=1738139397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tX+7Fy5cSnRoh3SFvELyGyWWn+cpGdNsJCXpeseT9w=;
        b=wF1U07PwsUZ9/eUIn1yXd9eQhR7W3ZJqdVcKixt9YcPkvBYYYtMDeDUVtWC/ivt+Vj
         iwFNZsgemHCMdBmXBmmyUr9Fk831zRhgTQscXAWP340vYzbf26TVOdWRFAmmSuoD8p9/
         hBg1VhNmiR8IXnAl3ljJ4eR8bemBh/WiFAYzlWBsgQXR2iLqR5YON36cS37Fb7qnw4Rk
         cSTliON08uIaNQtFjSTBdqsZgKMRQ0JJfbyTqYXZaDh4BdfYoWuv+Wu/IFHqdufSeO2N
         9zRsfIoOSkDWvWWVwheH4+RaEzCB2tX5zSytzeKgNPSblkEKi0eyKPAv2q6ZHSol1wby
         vuaw==
X-Forwarded-Encrypted: i=1; AJvYcCVpl6dyIObLgFeL3nR3i9YyI400M0OykhQ1/iynDGB3D6IuN4gSkDeuDUTk/POghjLsPtANGbchOiF2tF8=@vger.kernel.org, AJvYcCWas0wHjyzWosHDPb2f/AokPWww22LflvqQIBiUDWUxY3niqXEu8IjDxQipGJtE+VaDG9tK4bk5QYqAoJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOc/X/bUWz40gQ87IgKq4oMEUjJASOmOSVdFEnbo9YXqhoxX9H
	VxlT9yeFe6JVEAN420xx2FXv1OHb4yyxcr9NtFiOYoFL3rNxY6eX2RRvegIIjCJpDK16ca3RMuI
	X6S4OZXzg7vOR8zOu/u6e6Ubg0NM=
X-Gm-Gg: ASbGncvWp4pMNdv61yBO/EngzuN9sFzNPefiQuwWfE1txZ/j0Ao5K+cagC+bb4UWQxG
	0FNWifrc+vujQoDHNXIoID58qY+5rMNlsEKNHbJppX2RcHPM=
X-Google-Smtp-Source: AGHT+IFjNo4Ziz5HOfDmkBLJDQr0WPy+nzSKjWQJu2Upckf5ZkcCDWI9Xqhkj7l4u7vuHb/VOquDY/gNR2K/Is72F0w=
X-Received: by 2002:a17:90a:d00b:b0:2ee:a4f2:b311 with SMTP id
 98e67ed59e1d1-2f782c907ffmr29514751a91.8.1737534596714; Wed, 22 Jan 2025
 00:29:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121181322.1278407-1-daniel.baluta@nxp.com>
In-Reply-To: <20250121181322.1278407-1-daniel.baluta@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Jan 2025 10:31:20 +0200
X-Gm-Features: AbW1kvbyizWsX7zmuqkfBCUIMaaxoroBm_U-y6Bd3bN5vuzm0HmUkcytm-UPP2I
Message-ID: <CAEnQRZAmb_j_fDrEHP=NaA6jv_tpZdsOLxVxziCf8Ax-GMbprw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8m: add SAI2,5,6,7
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: broonie@kernel.org, iuliana.prodan@nxp.com, laurentiu.mihalcea@nxp.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
	lgirdwood@gmail.com, imx@lists.linux.dev, 
	Alexander Boehm <aboehm@eurofunk.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 8:14=E2=80=AFPM Daniel Baluta <daniel.baluta@nxp.co=
m> wrote:
>
> From: Alexander Boehm <aboehm@eurofunk.com>
>
> Added the remaining SAIs in addition to SAI1 and SAI3. There is no SAI4.
>
> Signed-off-by: Alexander Boehm <aboehm@eurofunk.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

I've resent this as v2 and added my SOB line.
