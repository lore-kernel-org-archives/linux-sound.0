Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797F437C108
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563049; cv=none; b=C2/KD2ngsskY6VCcjH4zisSeA8Z5Oe4vCOxyUaW4IOOyx2Rlh+xjAsFuRA9IOQ2R2S3uhfwHDBm0SXQRbCqF9TVhCiWM5xCjPr+h4L7tE3eDQhX/8csIxmBhWIyU1VBUWvFBiiWYtkyJ5N9ZkIO54sfS4U0/MakWPgwS8UgCGtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563049; c=relaxed/simple;
	bh=EKyfQQ2TaM1rIepk3Fag9XWc9XJqkiGHUrbfRXEtWk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlzVD8Gxq9PYyO+k3iTE6cAsYZuyKGEjpqlD6xVrwjTMkQA6rx77h23uUZkLaP1GMJHh+LX5kNHRfYhUpLgLBzjzKvnFdNmR3f/uhcRLeYTfZshipUpLoNHt++RMnQZylxQTqF0SM+gYKB3s3lV0ygEaUa2qMZdYvhoLIQhzKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkqQzKyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkqQzKyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD041F0089E
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563041;
	bh=EKyfQQ2TaM1rIepk3Fag9XWc9XJqkiGHUrbfRXEtWk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HkqQzKyVyQCXKb7NxL/+wOQ34Pu2u3V8SKF/mOhcy2ONYdrGGiPUFPcKAg6qiiiyz
	 brMXZiLekfrv95SdvmqcAs6VddMqClnx3Olx1YYRq7/VUzC2eKAxGhePFbM4mzOzFC
	 M+a7m1EDEbZsGv6tCJEkykNxAeXrhHhjYj3FjRN776GsH+jBrjefpMN37nF/aL5KTj
	 jPqNS7F8dpLn257yCEwxJXSGjk0ib+jwbNVuQ4YcPxMDkvn9o5eRPmpnTUnxV/EpIe
	 JXPJMbJ9Gc9l4L+s0lKEI5Bdwv5dtadtNH8PkhUzJWKrRAANp/PHrP7Yo6M5t8nI1r
	 lnZSiW1l20G6w==
Received: by mail-lr2-f17.google.com with SMTP id 38308e7fff4ca-3a5d4688decso8482641fa.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:50:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQtCrmgV3lTRw/8MjJgUupof0jWCK6tY+V3h8AV2HSjGlF8CWAWVdQ4BQm+Hn6+sdvRuMCJUqYrh675g==@vger.kernel.org
X-Gm-Message-State: AFuF++kOV2WI+c5Ki+8JxCfYXFnenx2/FNjEBMW+gy1jBhfS3L+AOr++
	pUyJyMcjS17mWyE+/MX0/BsxdHtRMKVom9k5LjeJ3469OGzY9bajOWvBn7MUhv0UiQnkd9+zq5e
	TDLCJ9HyT5Yc4kvbBjamjHt+4+8J6VPU=
X-Received: by 2002:a05:6512:128f:b0:5b6:1a7c:fd80 with SMTP id
 2adb3069b0e04-5b8b6652879mr760635e87.38.1789563039703; Wed, 16 Sep 2026
 05:50:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915202038.3534453-1-arnd@kernel.org> <9448f046-5756-4461-a932-652f9c72d65a@sirena.org.uk>
In-Reply-To: <9448f046-5756-4461-a932-652f9c72d65a@sirena.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 14:50:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnm6Dg-qU7erAUA82_BMjXGCu1LBaysCoRfTo1a2+eLmg@mail.gmail.com>
X-Gm-Features: AcwNN1VMUOowBapkI7YjN1TCJUNEmiUXCJgAuAV47Oa4pgz5wVkDgNpTkzZ-ADY
Message-ID: <CAD++jLnm6Dg-qU7erAUA82_BMjXGCu1LBaysCoRfTo1a2+eLmg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ux500: avoid -Wparentheses warning
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Tue, Sep 15, 2026 at 10:20:31PM +0200, Arnd Bergmann wrote:

> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > gcc warns about a slightly confusing expression in two lines
> > of this driver:
>
> Sasha already posted a fix for this which I'd been hoping Linus would
> review.

Hm I must have missed it, I'll go and dig it out.

Yours,
Linus Walleij
