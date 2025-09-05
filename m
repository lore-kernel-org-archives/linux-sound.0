Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0297920F09C
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072866; cv=none; b=W8bVtc3lexBDJXKVe+m/qZuNRhMi8uwOTkly6YSv/UJJt8NZUZFfxBaZuEQ8bU+ZQNGbaH26Zgc/WyrvEQi4KV0+Ty/fABo+u7ai48P4lvzmTqaf/BILUOZ8RkEjkPkJKRAH9+il61MNQ5siEjK0vB+xfBId51xr/8qOzkE8lXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072866; c=relaxed/simple;
	bh=xjvRbbqCUd90pL32O/qW+Q0UPrwzTCqVHL+HdMTcdRk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=N9xEvta5UmALRR1ajDcex3FnNbrOPV1Xjk7ZjH3I04SUKUj/YdgAFUKUeE9dln8Gl1nnAjQ/uqMK/EEDLNO1b5PPzy+FEywVBhffedZyH5XZ6n91m6DsjYVGgczEp+444gcuHGLgkLsnvZZ3arJ0CLADtK8cnsvBZ5C5qNNhAt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FTsc8i00; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FTsc8i00"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b0428b537e5so353651666b.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757072862; x=1757677662; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbkha3xHxjnuhdHDyvarbM178XTY5MF0exyUzCpgHFk=;
        b=FTsc8i003ZQ29kZAzsUlODtkps+1C1YxKqT/4TRWNjQgj70OTmJAtJFBecl/S73Nml
         vkdIziyrWWBFk8iyFJsQarewv+IYMj3hhRek2cAkfVvyK0TUspQeoX1md19dcPuKSKkt
         LYtO3GKhobSFmfQHg8/eOYGkLc4UH6T4ZtudoF+v2SrI2IpLC1jvohYPF5U7tFj+DWo2
         pRWZ1At3AFl3UbO5EvUXjmSiMkz6ofye41nBCxFEASNahdovPrIvyVUVRBj3JpCkkdwT
         bS2YSJpRGFUh0rcZAWd4pgLT7c/1iI5rneXCr2HOymo94xXm9de1hL5s+0YtLHBZ8oty
         KnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072862; x=1757677662;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fbkha3xHxjnuhdHDyvarbM178XTY5MF0exyUzCpgHFk=;
        b=XuLjuNaUUifMBs+RbGxMBctViiLmL4pdYIUDASTCatD6ZuxkYAqz23l0Wt7PDF9VaJ
         drB/B1Ehz10BbR0Dry8x/fQVH+9ujok33y46cZlJMDyJVVGI4rzb8whvpHkZzi3riTpw
         TeLxwfDlgF+tro5ZMMS1TvcSpDD69DyrLaVAz/yaPOga1We6A+tkG9OyCEvjGRAV8qME
         pQzL51QQlT0l7LzQNfbHjDTwtsqat5C/W2p7jY85bh8Mqaqt39Q53ulKfXdbYxDXMOVQ
         +ZDWkeDeEtVFdvhANVGij3bsBwvphdqKGYeZb5BnOWm/vvLBbkJcABvBIoiyhPVwvfrF
         l2cw==
X-Forwarded-Encrypted: i=1; AJvYcCVfTsmtUSNYyKULjDQSe8dJz/NJ3f7AH9dnuYinbgAhhonIylUuoofnXxlJnJHFkWZiIBu0Ig+RUL1EZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzotjsoReTUukxC+fXQa9s7+y2HZgdQyvC+ZfTZ1G/qgSPEhnYl
	TXgIUhsQTpWOrfEtB/dP1QMoHkbsYryXAvtKx46lBYe9Q/CXrAerwsndI3uECL/dG4U=
X-Gm-Gg: ASbGncsMFFohXkTG7S68Bh9ANVTY5tbWoax8QBxC5aUzbt34Vn+5u7fgwi/lvmPB9Gw
	dPG+UgKoESF0HuvMpLbFcqjCOpdtlKiEIy/euFaLHyWOSrdew/fq/nxyQzVLyy/Lxb7ZHFnRyBm
	W8ec9Yrnjo+W3cT/qdWJmfySAvbvGgotTgjO+MGr8ECjmZ6uTafpsTl/oQLJzJiBOojWdL+8TbF
	aL3V3HEkmz5V9yrxj+PF5od7502hcUOH1AInyCHsv8USzgEujrEdyk7G0C+79oYKlS/1PiUIfJM
	d93JSnEbE02XAyCCu908N0tnQxXUZpabB8TzFqIxNSuQbjNPrtmS3KhAeFkvNhV7V2VyQ1TZyUA
	Zj/njpVUV6LXJoigcQubibJpwRA2TSsq0gj3sY8yWj5+o4WUDnbzu/h+xgHcqbC2w0MCtVdSNCb
	2uMn/3KVKAu1he/6XxHNEDDPVZHNxXgYk=
X-Google-Smtp-Source: AGHT+IEbhmQN/y9mAER+quL5wmVNP5l3QBTUKDL8iDgd/w2dcSBWquvkTjCercqP5dSb1h0+ekSthQ==
X-Received: by 2002:a17:907:7f17:b0:b04:3c00:b934 with SMTP id a640c23a62f3a-b043c00f087mr1466016766b.21.1757072862145;
        Fri, 05 Sep 2025 04:47:42 -0700 (PDT)
Received: from localhost (ip-185-104-138-128.ptr.icomera.net. [185.104.138.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff07de1612sm1715742166b.105.2025.09.05.04.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 13:47:28 +0200
Message-Id: <DCKUCB8A1JCV.1GK0TW2YMXNZP@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Takashi Iwai" <tiwai@suse.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] ALSA: qc_audio_offload: try to reduce address space
 confusion
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250513123442.159936-1-arnd@kernel.org>
 <20250513123442.159936-4-arnd@kernel.org>
 <DBR2363A95M1.L9XBNC003490@fairphone.com> <87v7n72pg0.wl-tiwai@suse.de>
 <DBR3FZGY4QS1.BX6M1PZS5RH4@fairphone.com> <87ms8j2on6.wl-tiwai@suse.de>
In-Reply-To: <87ms8j2on6.wl-tiwai@suse.de>

Hi Takashi,

Sorry for the late reply, things got in the way.

On Fri Aug 1, 2025 at 2:49 PM CEST, Takashi Iwai wrote:
> On Fri, 01 Aug 2025 14:35:27 +0200,
> Luca Weiss wrote:
>>=20
>> Hi Takashi,
>>=20
>> On Fri Aug 1, 2025 at 2:31 PM CEST, Takashi Iwai wrote:
>> > On Fri, 01 Aug 2025 13:31:42 +0200,
>> > Luca Weiss wrote:
>> >>=20
>> >> Hi Arnd,
>> >>=20
>> >> On Tue May 13, 2025 at 2:34 PM CEST, Arnd Bergmann wrote:
>> >> > From: Arnd Bergmann <arnd@arndb.de>
>> >> >
>> >> > uaudio_transfer_buffer_setup() allocates a buffer for the subs->dev
>> >> > device, and the returned address for the buffer is a CPU local virt=
ual
>> >> > address that may or may not be in the linear mapping, as well as a =
DMA
>> >> > address token that is accessible by the USB device, and this in tur=
n
>> >> > may or may not correspond to the physical address.
>> >> >
>> >> > The use in the driver however assumes that these addresses are the
>> >> > linear map and the CPU physical address, respectively. Both are
>> >> > nonportable here, but in the end only the virtual address gets
>> >> > used by converting it to a physical address that gets mapped into
>> >> > a second iommu.
>> >> >
>> >> > Make this more explicit by pulling the conversion out first
>> >> > and warning if it is not part of the linear map, and using the
>> >> > actual physical address to map into the iommu in place of the
>> >> > dma address that may already be iommu-mapped into the usb host.
>> >>=20
>> >> This patch is breaking USB audio offloading on Qualcomm devices on 6.=
16,
>> >> as tested on sm6350 and sc7280-based smartphones.
>> >>=20
>> >> [  420.463176] q6afe-dai 3000000.remoteproc:glink-edge:apr:service@4:=
dais: AFE Port already open
>> >> [  420.472676] ------------[ cut here ]------------
>> >> [  420.472691] WARNING: CPU: 2 PID: 175 at sound/usb/qcom/qc_audio_of=
fload.c:1056 handle_uaudio_stream_req+0xea8/0x13f8 [snd_usb_audio_qmi]
>> >> [  420.472726] Modules linked in: rfcomm zram zsmalloc zstd_compress =
algif_hash algif_skcipher bnep nft_reject_inet nf_reject_ipv4 nf_reject_ipv=
6 nft_reject nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nf=
netlink ipv6 fuse uhid uinput snd_usb_audio_qmi q6asm_dai q6routing q6afe_d=
ai q6usb q6afe_clocks q6adm q6asm snd_q6dsp_common q6afe q6core apr pdr_int=
erface snd_soc_sm8250 snd_soc_qcom
>> >> _common snd_soc_qcom_offload_utils snd_soc_qcom_sdw soundwire_bus soc=
_usb snd_soc_core snd_compress snd_usb_audio ath10k_snoc ath10k_core snd_hw=
dep snd_usbmidi_lib ath fastrpc snd_pcm mac80211 hci_uart qrtr_smd snd_time=
r btqca qcom_pd_mapper snd_rawmidi bluetooth libarc4 qcom_pdr_msg cfg80211 =
snd soundcore ecdh_generic ecc rfkill qrtr qcom_stats qcom_q6v5_pas ipa qco=
m_pil_info qcom_q6v5 qcom_common
>> >> [  420.473018] CPU: 2 UID: 0 PID: 175 Comm: kworker/u32:9 Tainted: G =
       W           6.16.0 #1-postmarketos-qcom-sm6350 NONE
>> >> [  420.473033] Tainted: [W]=3DWARN
>> >> [  420.473038] Hardware name: Fairphone 4 (DT)
>> >> [  420.473045] Workqueue: qmi_msg_handler qmi_data_ready_work
>> >> [  420.473065] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
>> >> [  420.473075] pc : handle_uaudio_stream_req+0xea8/0x13f8 [snd_usb_au=
dio_qmi]
>> >> [  420.473091] lr : handle_uaudio_stream_req+0xc84/0x13f8 [snd_usb_au=
dio_qmi]
>> >> [  420.473104] sp : ffff800082f939a0
>> >> [  420.473110] x29: ffff800082f93b10 x28: ffff0000cfb796b8 x27: 00000=
00000008000
>> >> [  420.473128] x26: ffff0000842afc80 x25: ffffa8e75a23b0e0 x24: 00000=
00000008000
>> >> [  420.473145] x23: ffffa8e75a23bcf0 x22: ffff800082f93bd0 x21: 00000=
00000000000
>> >> [  420.473161] x20: ffff800082f93c98 x19: ffff0000939bb740 x18: ffffa=
8e77925a4d0
>> >> [  420.473178] x17: ffffffffffffffff x16: ffffa8e777ef9728 x15: ffffa=
8e77925a000
>> >> [  420.473194] x14: 0000000000000000 x13: 0000000000000dc0 x12: ffff8=
00080000000
>> >> [  420.473211] x11: 0000000000000cc0 x10: 0000000000000001 x9 : ffffa=
8e77944b880
>> >> [  420.473227] x8 : ffffd719b5f4d000 x7 : ffff00009033da18 x6 : 00000=
00000000000
>> >> [  420.473244] x5 : 0000000000000000 x4 : ffff800082f93938 x3 : 00000=
00000000000
>> >> [  420.473260] x2 : 0000000000000000 x1 : ffff0000857790c0 x0 : 00000=
00000000000
>> >> [  420.473277] Call trace:
>> >> [  420.473283]  handle_uaudio_stream_req+0xea8/0x13f8 [snd_usb_audio_=
qmi] (P)
>> >> [  420.473300]  qmi_invoke_handler+0xbc/0x108
>> >> [  420.473314]  qmi_handle_message+0x90/0x1a8
>> >> [  420.473326]  qmi_data_ready_work+0x210/0x390
>> >> [  420.473339]  process_one_work+0x150/0x3a0
>> >> [  420.473351]  worker_thread+0x288/0x480
>> >> [  420.473362]  kthread+0x118/0x1e0
>> >> [  420.473375]  ret_from_fork+0x10/0x20
>> >> [  420.473390] ---[ end trace 0000000000000000 ]---
>> >> [  420.479244] qcom-q6afe aprsvc:service:4:4: cmd =3D 0x100e5 returne=
d error =3D 0x1
>> >> [  420.479540] qcom-q6afe aprsvc:service:4:4: DSP returned error[1]
>> >> [  420.479558] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x7=
000 failed -22
>> >> [  420.479572] q6afe-dai 3000000.remoteproc:glink-edge:apr:service@4:=
dais: fail to start AFE port 88
>> >> [  420.479583] q6afe-dai 3000000.remoteproc:glink-edge:apr:service@4:=
dais: ASoC error (-22): at snd_soc_dai_prepare() on USB_RX
>> >>=20
>> >> Reverting this patch makes it work as expected on 6.16.0.
>> >>=20
>> >> Let me know if I can be of any help to resolve this.
>> >
>> > I guess just dropping WARN_ON() would help?
>> >
>> > As far as I read the code, pa argument isn't used at all in
>> > uaudio_iommu_map() unless as sgt is NULL.  In this case, sgt is never
>> > NULL, hence the pa argument is just a placeholder.
>> > That said, the whole xfer_buf_pa (and its sanity check) can be dropped
>> > there.
>>=20
>> Just the WARN splat is not the problem, it's actually failing
>> afterwards. Without the patch it works as expected.
>
> OK, I wasn't clear enough; I meant to drop WARN_ON() *and* its error
> handling:
>
> 	if (WARN_ON(!page_is_ram(PFN_DOWN(xfer_buf_pa)))) {
> 		ret =3D -ENXIO;
> 		goto unmap_sync;
> 	}
>
> That is, replace WARN_ON() with 0.
>
> 	if (0 /*WARN_ON(!page_is_ram(PFN_DOWN(xfer_buf_pa)))*/) {
> 		ret =3D -ENXIO;
> 		goto unmap_sync;
> 	}

Yes, that appears to work fine as well. Playback works again.

>
> But you can try the patch I put in my previous reply instead (which
> will remove all unneeded ).

That patch doesn't compile for me with this error:

In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:6,
                 from ./include/linux/kasan-checks.h:5,
                 from ./include/asm-generic/rwonce.h:26,
                 from ./arch/arm64/include/asm/rwonce.h:67,
                 from ./include/linux/compiler.h:390,
                 from ./include/linux/dev_printk.h:14,
                 from ./include/linux/device.h:15,
                 from ./include/linux/auxiliary_bus.h:11,
                 from sound/usb/qcom/qc_audio_offload.c:6:
sound/usb/qcom/qc_audio_offload.c: In function 'uaudio_transfer_buffer_setu=
p':
./include/linux/stddef.h:8:14: error: passing argument 3 of 'uaudio_iommu_m=
ap' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^~~~~~~~~~~
      |              |
      |              void *
sound/usb/qcom/qc_audio_offload.c:1059:48: note: in expansion of macro 'NUL=
L'
 1059 |                                                NULL, len, &xfer_buf=
_sgt);
      |                                                ^~~~
sound/usb/qcom/qc_audio_offload.c:555:51: note: expected 'phys_addr_t' {aka=
 'long long unsigned int'} but argument is of type 'void *'
  555 |                                       phys_addr_t pa, size_t size,
      |                                       ~~~~~~~~~~~~^~


Regards
Luca

>
>
> thanks,
>
> Takashi

