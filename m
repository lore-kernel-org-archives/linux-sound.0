Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D163BED30;
	Mon, 10 Aug 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360571; cv=none; b=PspK6x/MyZvpqDA86iIcd54KtTJ1AiXwIg0Uc/gvEBQtfqSs+eTY8vA6teJNvGwgLZxA6NgNIgeF2qHn/vhAkeAobcghsQJuAzVO8zuFjffbevvOcB1VOD5quMFXx2RwuuiD8CDfcoFDa9EFZ95bESgA641m3pgTE5p/S05fXss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360571; c=relaxed/simple;
	bh=xD7TpoU6FiT0rW0sFPGrPUBieauQATHv8LRo5lIRDbM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kiNe3+Str9tZg7tZKua+QC5bCJjLJyqlBEgvWhbqMsdr4cTd/4f0ik1rjDuypCJbMvmdaqc6WNG81F+wJBnO0rBvuLmiu0+W5YDKyVgn+sc9105LzecBdwLslkJ4Yuw5gD+lmpw/fxpfIjVKQW/+KbaJLP95Q2Shr/RV397wLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pNJXdqmR; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pNJXdqmR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=xD7TpoU6FiT0rW0sFPGrPUBieauQATHv8LRo5lIRDbM=; b=pNJXdqmRFGwd1s3WiCUwHBquXa
	s//iXaF8eOaxDfmPJ27nI+EFUaabeH8ATk/EISXaN1IEPzvT1QxLMgWYobnXq6u3gB2u1pd3G5FWL
	X7b+mfqZ0RKDceVhDFpCcETtQpNTmpnQm1nVtQz/8QkfWOdh7VbTezeDjGvP5oEdkKZ7rKhwjBEZU
	Xz99a33jhKDTWmezZC8SKBVsYXdO0VYQ/1oFGiL2wL2jqQdj8WQ7zDImUmoX3DH8ZyF2H9UXJA3OS
	0vDNNQIRT2l5kUipORMZnr6zkR8f8xLnu/Of1MFdMdXvgqD3U//WZ3BsC/zRcQYis4YMVjhzAoLlK
	qfIOvsRw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtNz1-00GYKG-6q; Mon, 10 Aug 2026 13:15:55 +0200
From: Luis Henriques <luis@igalia.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,  Bard Liao
 <yung-chuan.liao@linux.intel.com>,  Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Mark Brown <broonie@kernel.org>,
  linux-sound@vger.kernel.org,  patches@opensource.cirrus.com,
  linux-kernel@vger.kernel.org,  kernel-dev@igalia.com
Subject: Re: [PATCH] ASoC: SDCA: Add missing sdca_fdl_free_state definition
In-Reply-To: <c304c661c9c2f38f6e5e73ee4e36849d899e9368.camel@opensource.cirrus.com>
	(Maciej Strozek's message of "Mon, 10 Aug 2026 10:43:42 +0000")
References: <20260810095512.27087-1-luis@igalia.com>
	<c304c661c9c2f38f6e5e73ee4e36849d899e9368.camel@opensource.cirrus.com>
Date: Mon, 10 Aug 2026 12:16:15 +0100
Message-ID: <874ih2cjk0.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10 2026, Maciej Strozek wrote:

> W=C2=A0dniu pon, 10.08.2026 o=C2=A0godzinie 10=E2=88=B655=E2=80=89+0100, =
u=C5=BCytkownik Luis
> Henriques napisa=C5=82:
>> This patch fixes a build failure introduced by commit 0880082c27b6
>> ("ASoC:
>> SDCA: Remove devm from primary IRQ cleanup").=C2=A0 It simply adds
>> function
>> sdca_fdl_free_state when SND_SOC_SDCA_FDL isn't defined.
>>=20
> This was already fixed here:
> https://lore.kernel.org/linux-sound/20260730130602.3747053-1-ckeepax@open=
source.cirrus.com/T/#u

I did a quick search before sending a fix and totally failed to see that.
Sorry for the noise!

Cheers,
--=20
Lu=C3=ADs
