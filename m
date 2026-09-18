Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2882525A73
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789763508; cv=pass; b=kTx49kDdn5LhO0IbucwzUeKW2YmZxHQpLzcVhNcmtV5PUjyQ8LK0XzHMpsYWioTExaMYxlVnubdr+SazI1RPGlDdGjgmmRLEdmxYdShBihabYNFywIAVpVd2hvkggSuKfzAybhXCODqPclgV+Ks/N051EUzAN9kiyFKaxVPfMto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789763508; c=relaxed/simple;
	bh=B8p7ihCHzGvnzup/C6y6XYLlWrQRIq7YUbOlQS6xj3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbjaCHxKH/cTsWuERgxLL7dqTiCD+B5Lf0sqzn7VhirooiHNiRmdVSFZnZ11Q1eu/wVJPXa/K0o/oJCDOp8MonhQCOJ9OysR9tVodT1barjWcRxCCZTSn1IZrQqcbNsogCtawF5F2/d+GwfnKxujb3joxVzMq+PMvXFCDU8/OJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvhkiZt+; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvhkiZt+"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-530f6bcc301so55191cf.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789763502; cv=none;
        d=google.com; s=arc-20260327;
        b=Tn+7sR42whV8fYOJA3qsocds6mCIazozGS266rBE6BA3Mp8nxTFZ0Fkq0um8pD9MPu
         mcn2mxMG2yvDHb60kMXU8/pcUXqcOlBz0Qud5yho9q0MqSRN9vyYsNwFcw18bXAQn0vX
         XlDhx91bnyg8/8aQPAUUQNTiSKI93I/lYNTg/DLW250+XS6DMty+8HoeuZiYGicoLKhG
         HIbMI18bD9JboVvCmDstdYaKAuFvFb4Vb9jBvK1Ocbwh9jTATXM655JQEC74vo614JCM
         MwlZfwNxDra44hutoSwE8yFdEnZ2hKVRzv6Tk0DOjEUfBgSqRj8MWKgd3n/0kWOu7VM2
         3qIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rakr0DVeS6w19WPN+xiAqZEbcFGWWdpHaQBH8HXSGgc=;
        fh=U9xElCvhHF96Lo9SavarD9awY7o6/6Vg8MOH5T5cLMQ=;
        b=oC3nq2y27iXyaPO1N9TbusG0rWJYCGGomDdJCFGgqrIJsoQXGdVYqTTx6Achl9akDD
         jsCe92PAT0KAM2Oj6arJhrXwj4GaJSLvmK/35xSUnKobuDzEdpUOyDLrhBrLsbhRkbIm
         naSukxlfeyCQ/5dEsLl9QlOvnQX0oOsJrVNfuDjhNFiedO634Tr02iydw6HXomsgRxVy
         3HaE5O5s0/D5v9RFZTdXN8gvJ4mIz0h7TUNFkPUpQrzh9tryTm+pH4dkwDyTgWkqa84T
         88QXkRFip/gKcnfwa2HoOFF2G2L7kdg84TvjKi5ugWDLcz5KlevymAi1c5DxdOm92teW
         wgjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789763502; x=1790368302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rakr0DVeS6w19WPN+xiAqZEbcFGWWdpHaQBH8HXSGgc=;
        b=HvhkiZt+ne0KuTp63x2Nfk9bk93VPnNC8RklWn/exhepdV3cTtVNoUGuo1s4bGDneg
         gN42pWA5mFsfeDj8nSw5mDHGV5M+tZecNGT8Vyct7MSyt8JLD8Ec1wIGxnY0cWr9seF8
         Va8Y7UKFESKFwFJ4RtC6xeA0B5eKSifXJ5uzIWsykvRhw9+XiWtYAWD6Kq7RQjo3xOzN
         tGJmPp2VHrcK05I4ZdAQ1nJCxUR/CX1Sc1UoowlxGwetb6Qi/qn6BECOnqdkxCbg/FDZ
         YJFf9+ykfYe19xWL+M6scSOLpNqvJ0KcUqmtosPKZcZD1k8GnX+9NPbLM12i+mw8itqF
         oK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789763502; x=1790368302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rakr0DVeS6w19WPN+xiAqZEbcFGWWdpHaQBH8HXSGgc=;
        b=sJAKRDQCkgKBAK+XHX4jBOc+01A0v2s/118Kffg/4HNUUEN7Gij0jUkZfNkUJqCmsb
         LDcA39s6Gl8+Axnvim2qdcXV2Kha/HB05NbIg1ai6jUS7j6Sc5ON6W51OybLMyxH5FRO
         MTTBG9ZvegSoEpMhGE6swrUNHX6uzmdCjCkPzY7JCT3zWQdpyXFnT4hsDLG2k7h83Yup
         2kV+ZGUZsxg2AIsHWKQPOY/X/ol5rUS0qduOO788WOgHzDAcO7xFulNuYIBjgGU0pXqL
         Iez/knKQ+Ea679/9sZSq+t6ANFY3vE2vfOsdZ/JZBVG9/SPOr+MTIwccXZjdF4obnQx3
         HPow==
X-Forwarded-Encrypted: i=1; AKwUvByQfqI9/BZxEWfoFqHux/1n5ulf87B4RjumwJR0aj0yV1CjQp5fUKC7e5qsUKRvMQC19wOnq98iYy4avw==@vger.kernel.org
X-Gm-Message-State: AFuF++n0DUCwXxF+euplz5OHVemiZ/ZUkuZ5myJCEQgjS/q4Gms9vKFM
	IRMpOefPeUnqECBfpiYRbPfVguKue4i7OOhn3RrIyxvHUIMXdUD67y3eiw8L6axCyyEaZgMCBoH
	GAbAgYbHsSen9875yV1RZpIYPbp5qcqTcJ09DYwER
X-Gm-Gg: AYBFou1g2kDxB01G17gWSakMEg05K3LbLeUdAIVI3FCMcqm2/cTYsxHtIdYTYAUPXRc
	UqXZic481Ufzz0q/uEWCKQmVyQRezJvgTVXreS8IAvPZh4zQf0E7XVOyKIHGidki8cCTquWeJjF
	z1e5Dq17TJWICvoduuoXxv5jSUkH4VFSbitR1doGycAFgVmpwpWx6h4GlFta544rKKspEEOBUfp
	1nB1Dplp3lBpI7m2czrSXoy8Mm6QM40B/mpZBVXoi1Gv5pi3G488fisI2qAxPeGXmnihvm2CEfk
	nwX0ulYdL9xJ7QqDtDrxz1POOG8U38cCjMUcKOke4pH/JZ9lszAmaA==
X-Received: by 2002:ac8:5d08:0:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-532b099561dmr605641cf.11.1789763497212; Fri, 18 Sep 2026
 13:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org> <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org>
In-Reply-To: <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 18 Sep 2026 13:31:24 -0700
X-Gm-Features: AcwNN1VqLTR47MatnNlBWbpWA8EMmoQNGykspJvqoxdaovPnF0EYfRCWZF-8zh0
Message-ID: <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate VM_SPECIAL
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, 
	selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:21=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/15/26 03:08, Andrew Morton wrote:
> > On Mon, 14 Sep 2026 15:57:20 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.=
org> wrote:
> >
> >> The VM_SPECIAL / VMA_SPECIAL_FLAGS mask conflates several unrelated
> >> properties:
> >>
> >> ...
> >>
> >> It's all rather a mess.
> >>
> >> This series brings some order to things by both limiting what drivers =
can
> >> do with VMA flags and switching to using predicates that describe
> >> behaviour, not arbitrary flags.
> >
> > That's a lot of patches.
> >
> > Review is thin and I expect this won't improve a lot.  Lots of "no
> > functional changes" changes.
>
> I'll expect to go through all of them. Might just take a bit ;)

ditto

>
> --
> Cheers,
>
> David
