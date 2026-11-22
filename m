Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365111;
	b=VZDYvngKU/7GaKdIKqlmhJkGIiiA2Em00fehqmWjszSDpCo+WUG+2tflxgwJA6HEo5oQ
	 E2iSSR+zrTenCVuundlCZ8lYIrgf/B+OZcvypUSeOvaqu50Yhne8exkwf8miI46ydTcOF
	 GSxbQxcf5IG3Q/sJTl7wHOkHAivme0kpOrTOvwHrVuRrmhvf1SVUO4O6NsVGgIL2CNZwa
	 sM/kSfNYPaflyVBrjxgOEMjIB0mThEiDa9AzOYOkYFwTFTsXiuBLXSO6/r5dH+lH4ccQ5
	 LDY8Ok5HUYMtO/BMJTuugLbxbOGFcifcNJEy4pxbV2sfYDyyQs2L/tSR7nvmYOXd/AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PJZUcg92KUlVhlGQpnFkkbq39Iv0d4zJyvXI3m4MzR8=;
	b=TXJlLCfjXQo6YVuYdtSKl3l9ifz6csixTSPSAhCBTMbFFqt00Sp0jvYXjC049n6wc8eQ
	 dQGi9F5rL7dUKpLiQuYn+x5urola8oBybPKWehcwOCnI/u1u7MqmoLyYCo66QduBBfgMH
	 vAyoTN1qcM+0DSQJSNbBJnAHTEZEsAJlRe/LcqV4APwDI7J/jK2YT8b5X4DZlAZY6/O2S
	 Jm+VccyKoBng/jNDlMXfFKxA0QNirpejTNlK+2nK6PZ+k/prq3BGid1ncM46iFaNYhjri
	 tbvzn0uQBlhFATHS4fR70aO+kPANodRw5WL5fZEtUcAC2l1DxaLEsq0FLMdUP/s6r+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUkRdhUN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A3E606A320;
	Sun, 22 Nov 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUkRdhUN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0006C1F000CA;
	Sun, 22 Nov 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365111;
	bh=PJZUcg92KUlVhlGQpnFkkbq39Iv0d4zJyvXI3m4MzR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jUkRdhUNBKM5GBm0wPrA2TWuA7A5VPQfeVfu92mjRrPlQ1lArH+9Xy6AZMbSUJ+sj
	 be5fyAbtcQVNe1QB48Inj6H4iboxO/s/4yheM7T/dfTNt0ilux5vvYCefV5UK0EOcp
	 VbDO/mBr1BGgjBH175sVV18miuNp7Jb8VhVOev/1KhH8wFvLx2Sz4x41Pv2eld2jwT
	 tzS+y6k7sLHGHVl94z6JVIcN5JNqWnDFKA7Mrp6WF1HFzAKCCDHTCM3NkLbXRn8Y9a
	 RxYHsjSx8Igj71fsBrlChZEumXM+Ih2qlo9pcurgCCkbgWMPkGZFerLKPph1YxJS7S
	 ByLmeFjQjiUtg==
Message-ID: <sashiko-outbox-228105@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/24] ASoC: qcom: audioreach: send static cfg blobs
 to speaker protection modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-16-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-16-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:31:50 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: qcom: audioreach: OOB read in
  audioreach_speaker_protection_send_chunk()
- [Medium] ASoC: qcom: audioreach: audioreach_sp_cfg_walk() fails on
  last sub-word param
--

commit b9c179f4213aeea501db81e0b9249ec6b4d1aa53
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: qcom: audioreach: send static cfg blobs to speaker protection modules

This commit sends the topology static configuration blob to the speaker
protection and VI sense modules in 8-byte-padded SET_CFG chunks once the
module is configured.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index 0701006278094..436d33ea568e3 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1949,6 +1949,141 @@ static int audioreach_speaker_protection_vi(struc=
t q6apm_graph *graph,
[ ... ]
> +static int audioreach_sp_cfg_walk(const u32 *word, u32 num_words, u32 ii=
d,
> +				  u32 first, u32 *next, u8 *dst, u32 max_bytes)
> +{
> +	u32 pos =3D first, bytes =3D 0;
> +
> +	while (pos < num_words) {
> +		u32 param_size, payload_words, avail, rec_bytes;
> +
> +		if (word[pos] !=3D iid || num_words - pos < 4)
> +			return -EINVAL;
> +
> +		param_size =3D word[pos + 2];
> +		avail =3D (num_words - pos - 4) * sizeof(u32);
> +		if (param_size < sizeof(u32) && avail && word[pos + 4] =3D=3D iid) {
> +			payload_words =3D 0;
> +		} else {
> +			if (param_size > avail)
> +				return -EINVAL;
> +			payload_words =3D DIV_ROUND_UP(param_size, sizeof(u32));
> +		}

[Severity: Medium]
Does this reject a valid cfg blob when a sub-word parameter without a
payload word is the final record in the blob?

At the end of the blob (pos + 4 =3D=3D num_words), avail is 0, so the if
condition evaluates to false and the else branch returns -EINVAL because
param_size > avail.  Checking (!avail || word[pos + 4] =3D=3D iid) would ha=
ndle
the trailing record as well.

[ ... ]

> +static int audioreach_speaker_protection_send_static_cfg(struct q6apm_gr=
aph *graph,
> +							 const struct audioreach_module *module,
> +							 const char *tag)
> +{
> +	u32 size, num_words, pos =3D 0;
> +	const u32 *word;
> +	int total, rc =3D 0, chunk =3D 0;
> +
> +	if (!module->data || !module->data->size)
> +		return 0;
> +
> +	size =3D le32_to_cpu(module->data->size);
> +	word =3D (const u32 *)module->data->data;
> +	num_words =3D size / sizeof(u32);
> +
> +	/* Not laid out as parameter records, so send it as the topology built =
it */
> +	if (size % sizeof(u32) || !num_words || word[0] !=3D module->instance_i=
d)
> +		return audioreach_speaker_protection_send_chunk(graph, tag, word, size=
, 0);

[Severity: Medium]
Can passing size to audioreach_speaker_protection_send_chunk() read past
the end of module->data->data when size % sizeof(u32) is non-zero?

In topology parsing, audioreach_get_module_priv_data() rounds the
allocation down to a whole number of 32-bit words while keeping
pdata->size set to the unrounded array_size:

sound/soc/qcom/qdsp6/topology.c:audioreach_get_module_priv_data() {
    ...
			nwords =3D array_size / sizeof(__le32);
    ...
			pdata =3D kzalloc_flex(*pdata, data, nwords);
			if (!pdata)
				return ERR_PTR(-ENOMEM);

			memcpy(pdata, ((u8 *)private->data + sz),
			       struct_size(pdata, data, nwords));
    ...
}

When size is not a multiple of sizeof(u32) (including 1 <=3D size <=3D 3,
where num_words is 0), module->data->data only has num_words * sizeof(u32)
bytes allocated, so memcpy(..., word, size) in
audioreach_speaker_protection_send_chunk() reads 1 to 3 bytes out of
bounds and sends them to the DSP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D15
