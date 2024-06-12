Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358817D896
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718201649; cv=none; b=vD7SNW7eSW9wuZD+HX23Eu7YEUcSxvVVhproj+SaRJZRdin+MaFd13sKevHZuqe/cczsKn7mEuSbYTRA0fv7xJ5CRq6bXheD2meQxjWtBkoDD8HCVw42zcUcOX1oFZPx+Oa1QVwwJD5YHMjpyIM8G8ogd136cRFwQCw3KzTDWa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718201649; c=relaxed/simple;
	bh=d3knsmleVF5oLLbBbEfmapdhHKBcgHtv6xgJG7Ql4+c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XxdSjQQVs+w9TFhSKWWslZJhpmfSKk3AVxtopHv4pUiORqlBMJro9ReSX7ZYVzfrGkn4loAKT5JpPgOQ23kRW7nZGfsLfCqSuCA9Z0ULJmM8z4V78fx+fOegDOodktjc7hT33lqUtvfDfhB8rRce39HYR8SKbpWU5Tf3qru3fI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (c3e47615.dsl.pool.telekom.hu [::ffff:195.228.118.21])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FD71.000000006669ABF9.00160909; Wed, 12 Jun 2024 16:08:57 +0200
Message-ID: <0ddd2c6ad1acd7436894f78956f59f54da1b18a1.camel@irl.hu>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7
 14ARP8
From: Gergo Koteles <soyer@irl.hu>
To:
  Gergely =?ISO-8859-1?Q?M=E9sz=E1ros?= <meszaros.gergely97@gmail.com>,
  Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Date: Wed, 12 Jun 2024 16:08:57 +0200
In-Reply-To: <a9d59988-da7f-4a53-8df1-3b6a7e6d24b7@gmail.com>
References: <a9d59988-da7f-4a53-8df1-3b6a7e6d24b7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Gergely,

On Tue, 2024-06-11 at 20:36 +0200, Gergely M=C3=A9sz=C3=A1ros wrote:
> +/* Similar to above the Lenovo Yoga Pro 7 14ARP8 PCI SSID matches the co=
dec SSID of the
> +   Legion Y9000X 2022 IAH7.*/
> +static void alc287_fixup_yoga_pro_7_14arp8(struct hda_codec *codec,
> +					   const struct hda_fixup *fix,
> +					   int action)

Can this shared function and fixup be renamed to include Legion IAH7?

> +{
> +	int id;
> +
> +	if (codec->core.subsystem_id =3D=3D 0x17aa386e)
> +		id =3D ALC287_FIXUP_CS35L41_I2C_2; /* Legion Y9000X 2022 IAH7 */
> +	else
> +		id =3D ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2; /* Yoga Pro 7 =
14ARP8 */


Does the amplifier work also with ALC285_FIXUP_THINKPAD_HEADSET_JACK?
If so, ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2 is unnecessary.

Best regards,
Gergo


