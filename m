Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F30D495515
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 21:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889104; cv=pass; b=j/mR3Q6kgaFsylmPa7IzsLIsaHh+YGAg4P/yw/z5EWNiybuCn3678MbZwtXm6VPq1rW1Njh2basvZ7bmcv2BULMIN/3UZi58fa4rWXIydp4Ak1xDFb65WaWf9WvoTPi1vxfzJI635iUGbn3qLIB8Tam1gdq5BG5P1GKVnB7jzek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889104; c=relaxed/simple;
	bh=Ik+DBM21R/jxw2hg5gwTR0MP605oy9En+2UQnCx6kfM=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7NxXePBpatDqV4fW5RkNkdwUecdciCVXf5zWSy9F3ot1G9o8dURMpflCDqqi6aREDQfNoiztkqGRZEejS6BPx1fu8sxlwEvIm5F4ET8m79hh0mtNfzWWL+FufY156o58Ypm9L8+ixjy1IZp8/AgbxlkQ8Zg3eb9JvhZj1wTWRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZf0oQes; arc=pass smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZf0oQes"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6dcf9ea1bfeso169768eaf.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 14:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790889101; cv=none;
        d=google.com; s=arc-20260327;
        b=qTGwu0nM2c5uPNrLR8C/epzwM75UHRJg05934bvKYCHdAIdLtM7WdEpcCdoTlI2jRL
         H0Qz9a0u5KYml/YOxCBi/vsJm0iDiyAQ4UditlbSE67nu28QKOdEMaNWfgoa3GSplAms
         175AKOM32chkdxBa5bBgJuaQsri7po2Ns/OPV+kigaprD5ildZ/XWZrhtZnfWSBne93r
         +MmTX6Lx/r+6ziSiuK7ccqmydsP+9GP4ckuLBJabmVGDM18fYxwJArjhl2nlNZegecEN
         w7UY4OFYQ4nm8hZOerx224C8bcfbeDoJPZ3T9keau3grNSYaQzb7236nk+bhzCYPVa13
         gq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=oZctRr8zoPKp/E3Dg+UTNYLjUUSntHgHjArjfLIumMY=;
        fh=+2HJ3iCAjOtMWnYQ3B7+FGMnMx6FHYBBep5Nw2t65Cc=;
        b=bTwXRtzbtYR5Esn9dDr4lWhd5HmCg+hMIZ6IAYqplXSEiB39s3KYjeEivkJsdkakAu
         yMG/lEKRv5JL0X9zC4+R9YqLTalVnzQbIKYrrztkGx/orjUh1sC3q9Gnk2QUjiKEPd7a
         cXwUoea0x8NTgf7Z/HYnMDW8wORQWQkSA80HWVbdAyuexIHOW74cxYYPpzC8nsNe91gX
         kON6i0FM9yOv+5dgv4R0Uchl5pX47j02BUwyUHlpdBk2plm9GF078PJc35cfClZ6h+c8
         6Qs1y82q7RMYqNBjtVJpYyYMPeSeERN4x587o7m6sDHKtG7yvNT35QwVi7PK+02r9mxy
         Lwjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790889101; x=1791493901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZctRr8zoPKp/E3Dg+UTNYLjUUSntHgHjArjfLIumMY=;
        b=VZf0oQesTgl69AMD6qkXGbjt+xJiF8eZGFOwCPZlJTfrGp1G+2akOMgJXPBOjJCNAG
         2xWNQEZwYOn1QBUrCQL/5+HD0AquYhAKAbE3mTKOVrE+2Ux3hQ/kOtKF0i8iN5M3U9/I
         C5AKdf8p0UwjqL3xebrldKTTBHTa2zc2ftd6VFMABKg2qoWHP0T0U+NL9b4z/SNgDIg9
         Ay1TI7S//TkzQ7cQv8nq636cufoyO1SRCXIr5yGb21Lre0zszERSbaSvTjYCSeBY9dli
         MyA5jKVjIuMcDPKLXZIjKtSYb3YX/owkA5jUZWMycaRyHu/U4zRD7Uo8UFQOrqSLqmfV
         ZPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889101; x=1791493901;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oZctRr8zoPKp/E3Dg+UTNYLjUUSntHgHjArjfLIumMY=;
        b=MDiDu0kw40imheK20pmz02O5Y5iR8W1jF3oRjuWvI4alf/vLSj/qNbdUdN0r2kAdi6
         OMfNKSmDVqbJPNF2CoAxv5s3tuvVZpZRR8GiDMoaSuPDAFt+Pf4NeOnwQMQpQU6WAXAD
         fMBwEFWEsr0ktoQvjlvx3QGX8rxNd6KiLcKD+kQYV1xjUYwXhBx0HzrB7loT+2KXgSWj
         PzVXO4rc/igkAvXFCNBZmGWWLrEpkMXYCaD3Vrd4HnZcohW+x/Kkj58nEFn4yM1Yj5s8
         pq3Bm2e1tCmLcyiHCs89Z08D2VZjE0V5A9cyPREfbM2KXD+LGQrLC3PtE61Ifpv+wQ4Y
         lP0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIZjlq9L8q0aA+QepMeKdmUIptUnlb/W8FvaZ97Ievb7HFjIuctsVWRBHtxB+0adOqz9na5YPdhHe9yQ==@vger.kernel.org
X-Gm-Message-State: AFuF++maRpGDD8fD0i7UBI99+SmdOEALDRRw3DUJ63MJKHQGdKznDHJR
	n7x0L9ySfkV+K96sQA3JbwSz8nVKfk407T+ABC15Km6Ou7Q11/cQJLc4n7plvaP2rdtp3yKrHuC
	S9Rnn6AcHvDExvHj8xKo4td/fdOLBzCo=
X-Gm-Gg: AYBFou0q3rlXmyFyxH6NLuKgDHxkma1i20S+hn7J7abeHPJkHCcE7YREV7YWXDzEzAn
	gCiWqNY4mrTEAG3rywjK8qVdyNV/c5kVzv4usJkwfjxcVBA7D7Rn3ViJZhYx+dKqNYmQNT31are
	rPoMhoeJm06w35WzfClWQkVaceY81M9tgEu2y4+SI/DuhTgQ8wpI7eQyy30MJNERrESbp4oYfsE
	ms00FeWiOF8ngSlx79PzRTqYxAPO7aFSVaQzxISYAVK6isdSg3H9gQzavDqRuDx+1wwznPx1d1M
	6c3wLjZbFDdpyKqH2zvMz2xmTO2XYIgetybfS40sHLe1dlhtd3gsQfIrFSZXWVImDD0CNjlXyYZ
	uk2x5R7jpOmbS+P6epUnQSVv3lO82W9PP
X-Received: by 2002:a05:6820:1787:b0:6b7:46e9:970d with SMTP id
 006d021491bc7-6df34d68bf8mr574186eaf.61.1790889100787; Thu, 01 Oct 2026
 14:11:40 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 1 Oct 2026 17:11:40 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 1 Oct 2026 17:11:40 -0400
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
 <20260925003030.1077471-3-mauriziocasciano7@gmail.com> <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
Date: Thu, 1 Oct 2026 17:11:40 -0400
X-Gm-Features: AclHuK9Z9xOsdb809jMX0x6_UphEwJuuq2Ji_72Tc7ViJlwAlS411GWAZxH8rw0
Message-ID: <CAO7O_xiEx85cDEqF4e76Hy+J8e9jsBUaoY8G_We_JFcf4kFBBQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
To: bard.liao@intel.com, broonie@kernel.org, linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, perex@perex.cz, 
	tiwai@suse.com, jekhor@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bard, all,

The SOF topology pull request has been merged into the stable-v2.15
branch and is scheduled for SOF v2.15:

https://github.com/thesofproject/sof/pull/11129

With Best Regards,
Maurizio Casciano


On Fri, 25 Sep 2026 14:05:57 +0000, "Liao, Bard" <bard.liao@intel.com> wrote:
> > -----Original Message-----
> > From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > Sent: Friday, September 25, 2026 8:31 AM
> > To: Mark Brown <broonie@kernel.org>; linux-sound@vger.kernel.org
> > Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; Liam Girdwood
> > <liam.r.girdwood@linux.intel.com>; Peter Ujfalusi
> > <peter.ujfalusi@linux.intel.com>; Yung-Chuan Liao <yung-
> > chuan.liao@linux.intel.com>; Kai Vehmanen <kai.vehmanen@linux.intel.com>;
> > Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>; Jaroslav Kysela
> > <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Yauhen Kharuzhy
> > <jekhor@gmail.com>; linux-kernel@vger.kernel.org; Maurizio Casciano
> > <mauriziocasciano7@gmail.com>
> > Subject: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
> >
> > The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
> > 10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
> > SST firmware and board names and the SOF topology name.
> >
> > The Intel DSP configuration selects one firmware path at probe time. SST
> > loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
> > sof-cht-rt5677.tplg through the standard firmware search path. The same
> > kernel and machine entry were boot-tested with both paths on a YB1-X91L.
> >
> > The SOF topology sources are maintained and distributed separately by the
> > SOF project.
>
> Please submit the topology PR on https://github.com/thesofproject/sof,
> too. Otherwise, there will be no topology available for the SOF.
>
> >
> > Assisted-by: LLM
> > Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > ---
> >  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
