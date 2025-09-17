Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE5B2C21C5
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758097169; cv=none; b=Bb6j0h1lftWCuhTEV+zngdHbM/BJEwSsG1WgOBa9mkekrmqD4Vy22AQ5IUDsZmRRVsqYyjwVbAxm9Rn83uX2d5MeT5oHZh+VucOv7M0OdHkw4GE17BREXONWKGhuVwRk+QZa5uJevFTZKChxnUudf0wc0+gM06nfMA31wQRNLFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758097169; c=relaxed/simple;
	bh=peOIbYU6htFMTQRA/VcBJe2Lsffwsbwp/kKlXcfL6GY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Ekr2Q5r2eUpIxKcwDYOz1rs/6uaWgIGfMiVy3+oPwNwyNeUlaRDDB//cN2NnWxtZPktAPP0XIKl0qEUB4zL9wTMJDsb2vZwMxFzVVbvDSYlrjsZcTtylsWrnVUzFzYzfRIPjyktd5tcLQf5S5G6nFu5ErL7y4w4AKxqGD55+OzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=M+czzIS+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="M+czzIS+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b0415e03e25so808770366b.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758097164; x=1758701964; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tulPDEUZIFKEReR+gBOBkznmrdl/S7EwDLj5UhpCJo=;
        b=M+czzIS+J5zTf+Qkfcrf3NetsTXIG7E7WXKgCvyPMtG64DovG8F66iPTLmtGiBOcc+
         lVeeRjddR6WVLgmylKFW00fCeMfaevXflytV0Xnw5YkmbO+Rk9AHCs+x68jGXQGuX0sB
         ATgPocoVEMPq3NFa323lXDsGIKzhbamT4LlbuPmRZDsG79rXHQgEA7IFBFJ5WSvffe29
         eAlS6+j/IP/lS9WJHjCHaqeMVi1ZQ6/GkJ1egVZ9v4mJr76rUNK4eR011yw2df5SB2rB
         KjTLUuN8Yya3PlSm/6KxxrwjsV4eFhq/GnXvaWVRavfWV2qUrVKQyGSmqPbvYs7WWt3X
         3sJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758097164; x=1758701964;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tulPDEUZIFKEReR+gBOBkznmrdl/S7EwDLj5UhpCJo=;
        b=jCTVG9g6W/nTWHcl4tnvZQ6sUfjA3qLCyNaFRoTNOTLzflBMffFzhBifbw9sNj0wn+
         z6CZr0kznfEglfaTBhoAzUamsAMSNHRtwnmUXn0vruPN9C5itpzf65bPv8vQSWlHfouW
         4R23MVcNhbPITZVsJ3VMMVBhlmBpWvkVzDDRWLSFmCsVi4pR2O36MO69a03yNnQ9FNUT
         acvisGQW6gwTX6KlZCTeHypmLX4rMR2XjwVQUx36hCltlMLnBJDgO6tWmSBfR8WPVJgu
         TF5mw5UohdDjbhrSp4V8uCDE7bcesF4iG+w1FQZvGtFM7Io5g2IMMNL2WZjoQy7coCCK
         7rew==
X-Forwarded-Encrypted: i=1; AJvYcCXBaDeOu/HlCt/0bOQ/s7eZT9xhpsENTDqzxJXhDSY9O0Ir6bEQ7E+3c828346Q0B56MCm5+v+6Ag8liQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRUZJi0tJzva38RoFmYGMgDAYsgkTnfGCFtZQ1NGis2Ur+pU0I
	JDpjanjqE5kx55lllUiyhruKlfUjySc+IFtKbLCymkTMFW4ZwtEau3y3QQIpgaPq7UA=
X-Gm-Gg: ASbGncvqhFgt9MfihuANjL0nmtB7DUbmqq/Yr8owx8iZd958q/lQL77jeYh3to0RkAv
	cLp27moldp4v+EBUXxfcXhU+1tk/H9mOPKQArdA+LIpxC1ALaJVnPjBhPqsnzKF1gkSTBYq8GsU
	HLk4eSuGpn/eMGgVV0M1jODXCGUPRKgh8cHIWp6fmDAmfGOHbqDnmcmxDEkZYnvQhJQXC70tLCQ
	wcF5EINRcO0Tm5p0ai325BcYzpWhLmQsqW1bjazHYbPD5kSoXfaI8NDR6C3iN0Xg9PcnGP7VgQj
	RVvhhPiJFiOqjW5l6PWKUt9k0DZC48URsZFbnjg8wWZRLxTpThNeIQNYAC/7U+3Y8NLdLsB4ZkW
	meVE6eYfZT4W3Ps84KEbCIa0HB4eC/IxzD95soAztZhg/fhPtWsTdaAg+YvXX6x1n1muUF2arq9
	HlwphACnj33xzG5T3ThAupMg==
X-Google-Smtp-Source: AGHT+IEFcyz4PFJ1ypPo7TZSmV9J03co38u+ISE3aEa6H9BlOHAkROj+JRNr+EhUcdLXbfcLPxcDOg==
X-Received: by 2002:a17:907:3d03:b0:b0e:bb58:652b with SMTP id a640c23a62f3a-b1bbb067465mr152904166b.39.1758097164392;
        Wed, 17 Sep 2025 01:19:24 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f1e26sm1342544466b.77.2025.09.17.01.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Sep 2025 10:19:23 +0200
Message-Id: <DCUXFIZ5KRCU.3JANM98BSE8SE@fairphone.com>
To: "Takashi Iwai" <tiwai@suse.de>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Arnd Bergmann" <arnd@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Wesley Cheng"
 <quic_wcheng@quicinc.com>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] ALSA: qc_audio_offload: try to reduce address space
 confusion
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250513123442.159936-1-arnd@kernel.org>
 <20250513123442.159936-4-arnd@kernel.org>
 <DBR2363A95M1.L9XBNC003490@fairphone.com> <87v7n72pg0.wl-tiwai@suse.de>
 <DBR3FZGY4QS1.BX6M1PZS5RH4@fairphone.com> <87ms8j2on6.wl-tiwai@suse.de>
 <DCKUCB8A1JCV.1GK0TW2YMXNZP@fairphone.com> <87bjnpqe45.wl-tiwai@suse.de>
 <a2a6843f-7e03-4b7e-b5fc-415ac9fc6621@app.fastmail.com>
 <DCU39JVDVFAG.2EOCQ37KAS3N0@fairphone.com> <87o6raxtu9.wl-tiwai@suse.de>
In-Reply-To: <87o6raxtu9.wl-tiwai@suse.de>

Hi Takashi,

On Tue Sep 16, 2025 at 6:09 PM CEST, Takashi Iwai wrote:
> On Tue, 16 Sep 2025 10:41:01 +0200,
> Luca Weiss wrote:
>>=20
>> Hi Arnd,
>>=20
>> On Fri Sep 5, 2025 at 4:54 PM CEST, Arnd Bergmann wrote:
>> > On Fri, Sep 5, 2025, at 14:26, Takashi Iwai wrote:
>> >> On Fri, 05 Sep 2025 13:47:28 +0200,
>> >
>> >> @@ -1051,18 +1050,13 @@ static int uaudio_transfer_buffer_setup(struc=
t=20
>> >> snd_usb_substream *subs,
>> >>  	if (!xfer_buf)
>> >>  		return -ENOMEM;
>> >>=20
>> >> -	/* Remapping is not possible if xfer_buf is outside of linear map *=
/
>> >> -	xfer_buf_pa =3D virt_to_phys(xfer_buf);
>> >> -	if (WARN_ON(!page_is_ram(PFN_DOWN(xfer_buf_pa)))) {
>> >> -		ret =3D -ENXIO;
>> >> -		goto unmap_sync;
>> >> -	}
>> >>  	dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
>> >>  			xfer_buf_dma, len);
>> >>=20
>> >>  	/* map the physical buffer into sysdev as well */
>> >> +	/* note: 0 is passed to pa argument as we use sgt */
>> >>  	xfer_buf_dma_sysdev =3D uaudio_iommu_map(MEM_XFER_BUF, dma_coherent=
,
>> >> -					       xfer_buf_pa, len, &xfer_buf_sgt);
>> >> +					       0, len, &xfer_buf_sgt);
>> >>  	if (!xfer_buf_dma_sysdev) {
>> >>  		ret =3D -ENOMEM;
>> >>  		goto unmap_sync;
>> >
>> >
>> > Makes sense. I had to rework the code a little more to actually
>> > understand how it fits together, for reference the below version
>> > (I don't expect it to build cleanly) would split up
>> > uaudio_iommu_map() into one function that takes a physical
>> > address and another function that takes an sg table.
>>=20
>> Are you planning to post this as a proper patch? It's a bit late in the
>> 6.17 cycle already but good to still get this fixed for final release.
>>=20
>> Or revert the original commit that broke it for now.
>>=20
>> I couldn't really test your patch since there's a couple of compile
>> errors where I wasn't sure how to resolve them correctly.
>
> Could you check the patch below, then?  At least it compiles without
> errors.

It does compile as well for me, but looks like it's not working.

It's still triggering the WARN_ON from

  if (WARN_ON(!page_is_ram(PFN_DOWN(xfer_buf_pa)))) {

[  214.157471] ------------[ cut here ]------------
[  214.157491] WARNING: CPU: 4 PID: 12 at sound/usb/qcom/qc_audio_offload.c=
:1067 handle_uaudio_stream_req+0xecc/0x13c4
[  214.157510] Modules linked in:
[  214.157522] CPU: 4 UID: 0 PID: 12 Comm: kworker/u32:0 Tainted: G        =
W           6.16.0-00047-gfa3c1e37ba38 #1 NONE=20
[  214.157531] Tainted: [W]=3DWARN
[  214.157535] Hardware name: Fairphone 4 (DT)
[  214.157541] Workqueue: qmi_msg_handler qmi_data_ready_work
[  214.157553] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  214.157560] pc : handle_uaudio_stream_req+0xecc/0x13c4
[  214.157568] lr : handle_uaudio_stream_req+0xcdc/0x13c4
[  214.157575] sp : ffff8000800b39d0
[  214.157579] x29: ffff8000800b3b40 x28: ffff0000895eb6b0 x27: 00000000000=
08000
[  214.157589] x26: ffff0000d6bae960 x25: ffffa11dbe275e28 x24: 00000000000=
08000
[  214.157598] x23: ffffa11dbe0a4ec0 x22: ffff8000800b3c00 x21: 00000000000=
00000
[  214.157608] x20: ffff8000800b3cc8 x19: ffff00008b128ac0 x18: ffffa11dbdf=
aa258
[  214.157617] x17: ffff0000803e9388 x16: ffff0000800162c0 x15: ffffa11dbdf=
aa000
[  214.157626] x14: 0000000000000500 x13: ffffa11dbe03c000 x12: 00000000000=
00000
[  214.157636] x11: 0000000000000001 x10: 0000000000000001 x9 : ffffa11dbe0=
f78a0
[  214.157645] x8 : ffffdee36909b000 x7 : ffff0000d6ac8418 x6 : 00000000000=
00000
[  214.157654] x5 : 0000000000000000 x4 : ffff8000800b3968 x3 : 00000000000=
00000
[  214.157663] x2 : 0000000000000000 x1 : ffff0000801a4100 x0 : 00000000000=
00000
[  214.157672] Call trace:
[  214.157677]  handle_uaudio_stream_req+0xecc/0x13c4 (P)
[  214.157687]  qmi_invoke_handler+0xb4/0x100
[  214.157694]  qmi_handle_message+0x88/0x1a0
[  214.157702]  qmi_data_ready_work+0x208/0x35c
[  214.157709]  process_one_work+0x144/0x2c4
[  214.157719]  worker_thread+0x280/0x45c
[  214.157726]  kthread+0xfc/0x1dc
[  214.157733]  ret_from_fork+0x10/0x20
[  214.157744] ---[ end trace 0000000000000000 ]---

Should that code be removed with the new code now?

Regards
Luca

>
>
> Takashi
>
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -538,38 +538,33 @@ static void uaudio_iommu_unmap(enum mem_type mtype,=
 unsigned long iova,
>  			umap_size, iova, mapped_iova_size);
>  }
> =20
> +static int uaudio_iommu_map_prot(bool dma_coherent)
> +{
> +	int prot =3D IOMMU_READ | IOMMU_WRITE;
> +
> +	if (dma_coherent)
> +		prot |=3D IOMMU_CACHE;
> +	return prot;
> +}
> +
>  /**
> - * uaudio_iommu_map() - maps iommu memory for adsp
> + * uaudio_iommu_map_pa() - maps iommu memory for adsp
>   * @mtype: ring type
>   * @dma_coherent: dma coherent
>   * @pa: physical address for ring/buffer
>   * @size: size of memory region
> - * @sgt: sg table for memory region
>   *
>   * Maps the XHCI related resources to a memory region that is assigned t=
o be
>   * used by the adsp.  This will be mapped to the domain, which is create=
d by
>   * the ASoC USB backend driver.
>   *
>   */
> -static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_cohe=
rent,
> -				      phys_addr_t pa, size_t size,
> -				      struct sg_table *sgt)
> +static unsigned long uaudio_iommu_map_pa(enum mem_type mtype, bool dma_c=
oherent,
> +					 phys_addr_t pa, size_t size)
>  {
> -	struct scatterlist *sg;
>  	unsigned long iova =3D 0;
> -	size_t total_len =3D 0;
> -	unsigned long iova_sg;
> -	phys_addr_t pa_sg;
>  	bool map =3D true;
> -	size_t sg_len;
> -	int prot;
> -	int ret;
> -	int i;
> -
> -	prot =3D IOMMU_READ | IOMMU_WRITE;
> -
> -	if (dma_coherent)
> -		prot |=3D IOMMU_CACHE;
> +	int prot =3D uaudio_iommu_map_prot(dma_coherent);
> =20
>  	switch (mtype) {
>  	case MEM_EVENT_RING:
> @@ -583,20 +578,41 @@ static unsigned long uaudio_iommu_map(enum mem_type=
 mtype, bool dma_coherent,
>  				     &uaudio_qdev->xfer_ring_iova_size,
>  				     &uaudio_qdev->xfer_ring_list, size);
>  		break;
> -	case MEM_XFER_BUF:
> -		iova =3D uaudio_get_iova(&uaudio_qdev->curr_xfer_buf_iova,
> -				     &uaudio_qdev->xfer_buf_iova_size,
> -				     &uaudio_qdev->xfer_buf_list, size);
> -		break;
>  	default:
>  		dev_err(uaudio_qdev->data->dev, "unknown mem type %d\n", mtype);
>  	}
> =20
>  	if (!iova || !map)
> -		goto done;
> +		return 0;
> =20
> -	if (!sgt)
> -		goto skip_sgt_map;
> +	iommu_map(uaudio_qdev->data->domain, iova, pa, size, prot, GFP_KERNEL);
> +
> +	return iova;
> +}
> +
> +static unsigned long uaudio_iommu_map_xfer_buf(bool dma_coherent, size_t=
 size,
> +					       struct sg_table *sgt)
> +{
> +	struct scatterlist *sg;
> +	unsigned long iova =3D 0;
> +	size_t total_len =3D 0;
> +	unsigned long iova_sg;
> +	phys_addr_t pa_sg;
> +	size_t sg_len;
> +	int prot =3D uaudio_iommu_map_prot(dma_coherent);
> +	int ret;
> +	int i;
> +
> +	prot =3D IOMMU_READ | IOMMU_WRITE;
> +
> +	if (dma_coherent)
> +		prot |=3D IOMMU_CACHE;
> +
> +	iova =3D uaudio_get_iova(&uaudio_qdev->curr_xfer_buf_iova,
> +			       &uaudio_qdev->xfer_buf_iova_size,
> +			       &uaudio_qdev->xfer_buf_list, size);
> +	if (!iova)
> +		goto done;
> =20
>  	iova_sg =3D iova;
>  	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> @@ -618,11 +634,6 @@ static unsigned long uaudio_iommu_map(enum mem_type =
mtype, bool dma_coherent,
>  		uaudio_iommu_unmap(MEM_XFER_BUF, iova, size, total_len);
>  		iova =3D 0;
>  	}
> -	return iova;
> -
> -skip_sgt_map:
> -	iommu_map(uaudio_qdev->data->domain, iova, pa, size, prot, GFP_KERNEL);
> -
>  done:
>  	return iova;
>  }
> @@ -1061,8 +1072,8 @@ static int uaudio_transfer_buffer_setup(struct snd_=
usb_substream *subs,
>  			xfer_buf_dma, len);
> =20
>  	/* map the physical buffer into sysdev as well */
> -	xfer_buf_dma_sysdev =3D uaudio_iommu_map(MEM_XFER_BUF, dma_coherent,
> -					       xfer_buf_pa, len, &xfer_buf_sgt);
> +	xfer_buf_dma_sysdev =3D uaudio_iommu_map_xfer_buf(dma_coherent,
> +							len, &xfer_buf_sgt);
>  	if (!xfer_buf_dma_sysdev) {
>  		ret =3D -ENOMEM;
>  		goto unmap_sync;
> @@ -1143,8 +1154,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *sub=
s,
>  	sg_free_table(sgt);
> =20
>  	/* data transfer ring */
> -	iova =3D uaudio_iommu_map(MEM_XFER_RING, dma_coherent, tr_pa,
> -			      PAGE_SIZE, NULL);
> +	iova =3D uaudio_iommu_map_pa(MEM_XFER_RING, dma_coherent, tr_pa,
> +				   PAGE_SIZE);
>  	if (!iova) {
>  		ret =3D -ENOMEM;
>  		goto clear_pa;
> @@ -1207,8 +1218,8 @@ static int uaudio_event_ring_setup(struct snd_usb_s=
ubstream *subs,
>  	mem_info->dma =3D sg_dma_address(sgt->sgl);
>  	sg_free_table(sgt);
> =20
> -	iova =3D uaudio_iommu_map(MEM_EVENT_RING, dma_coherent, er_pa,
> -			      PAGE_SIZE, NULL);
> +	iova =3D uaudio_iommu_map_pa(MEM_EVENT_RING, dma_coherent, er_pa,
> +				   PAGE_SIZE);
>  	if (!iova) {
>  		ret =3D -ENOMEM;
>  		goto clear_pa;

