Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44C406281
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739180; cv=none; b=M+5XWStmjQ5xgw4p12PBYXL/OKpO+vOiu0E04tTC3/MAqwsYS0jog0/wjMa9ht0it4dnJCgs3XLhgCV8gYnnXvreOYwD+D8z01G0Y6hbtR5QX5aXBxCwdZyfp5f4bA6J5Rhwi2es6nfhQ5n8A/o2Up5q098fOhRlBifRVhmALEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739180; c=relaxed/simple;
	bh=Xx9QxY6bFvblKuF9fqzy/22glD5cAtCYOVd52XDjTz8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=YgYBL0Kl9Xd/C25vGDpbGBCTW099dDerTqLjimRnMLCbviZfzJ4zvyD+3j7mjd46pjACg4Gl4X33D7Ad2N11EZ8l3CYX3BpUCXggBaOJ/mz4GXOfRxPy6O+WQUIVocG6802HDIPa7hrO0QihbI5QBsWI+KOLyqxzsCoeWqe519I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=a5MRZBqo; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="a5MRZBqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1782739171;
 bh=DjZIrJ6HPGKrOfJ3YW/zETR3k0l6it1CRKz8MwuOQ3E=;
 b=a5MRZBqoL0c6kA407PpejTe4lyELZaojMHqemb0PiXk7RTZvwH2mlLeaOjHwPPVTH67pTzgiL
 QYUrGmjhqPk3/FTzuqlTeHKq5mBGLSXI8vIJgHr58BdxgUKvGUrAse6sAS5VJr9Q5Hph3cKIu4N
 Szmh4vm7w/zwocOlQ7Kh4t/ODAaSXBr3bIi41/30r9r3R1V6Ui6+KGpyzWyLR48bkMD5LbDqXGT
 vbp+BYDuzXpTustpygHeY37aZT0bt6gFQ/y7MQpLACYZxKMyv1gDh/fumrYBYffyNgVsKoRFOsc
 8R+EukVJCZbF20H/XUlDB+mPTtRxvZAsF63EJWeakjaA==
X-Forward-Email-ID: 6a4270e1b7cb0eea61504834
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.9.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 29 Jun 2026 09:19:27 -0400
Message-Id: <DJLKAJ8IU0Z5.EU158RDQ31H0@ubuntu.com>
Subject: Re: [PATCH v2 4/7] ASoC: apple: mca: Support FEs being clock
 consumers
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "James Calligeros" <jcalligeros99@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: <asahi@lists.linux.dev>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
 <20260628-apple-audio-redux-v2-4-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-4-6328269c9652@gmail.com>

On Sun Jun 28, 2026 at 7:42 AM EDT, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>
> Support FEs being I2S clock consumers. This does not mean we support
> accepting clocks from outside the SoC (although it paves the way for
> that support in the future), but it means multiple FEs can attach to one
> BE, one being clock producer and the rest clock consumers.
>
> This is useful for grabbing I/V sense data on some machines, since in
> such a scenario the format of the sense data on the I2S bus differs
> from that of the audio data (the two formats differing in slot width).
> With two FEs attached to the bus, we can split the responsibilities and
> command different slot widths to the two.
>
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  sound/soc/apple/mca.c | 129 ++++++++++++++++++++-----
>  1 file changed, 106 insertions(+), 23 deletions(-)
>
> diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
> index 730ffe0805e1..0c1fc8242907 100644
> --- a/sound/soc/apple/mca.c
> +++ b/sound/soc/apple/mca.c
> @@ -380,6 +406,57 @@ static int mca_be_hw_free(struct snd_pcm_substream *=
substream,
>  	return 0;
>  }
> =20
> +static int mca_fe_prepare(struct snd_pcm_substream *substream,
> +			  struct snd_soc_dai *dai)
> +{
> +	struct mca_cluster *cl =3D mca_dai_to_cluster(dai);
> +	struct mca_data *mca =3D cl->host;
> +
> +	if (cl->clk_provider)
> +		return 0;
> +
> +	/* Turn on the cluster power domain if not already in use */
> +	if (!cl->syncgen_in_use) {
> +		int port =3D mca_fe_get_port(substream);
> +
> +		cl->pd_link =3D device_link_add(mca->dev, cl->pd_dev,
> +					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
> +						DL_FLAG_RPM_ACTIVE);
> +		if (!cl->pd_link) {
> +			dev_err(mca->dev,
> +				"cluster %d: unable to prop-up power domain\n", cl->no);
> +			return -EINVAL;
> +		}
> +
> +		writel_relaxed(port + 6 + 1,
> +			       cl->base + REG_SYNCGEN_MCLK_SEL);

Where does the "6 + 1" come from, and should it have its own #define?

-Josh
