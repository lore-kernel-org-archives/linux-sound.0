Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7764531B0E
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173880; cv=pass; b=oScZpezucS9Tl/7JnzKPeXN7XrUxbF34Nuc5lXtmyirzRMNjvk4ofBVChQMmWAkZgFyoE4rDpadbZmegFNTRYexPhdvo8EtIyp9c27OoNWiqfHeU+Umg9PffMbYyHyTzzzZXxTKvuz+WvN4QA2CiCIQyXLkyZnsPDzarX/Ng8ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173880; c=relaxed/simple;
	bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyvsirm6Jati/jRBgkeVRi1IfPbmyUbefUto8JrJoQLyx1wXicDkuOSjPtRKQddMbBlBvVzuUk5UPJL0ZEs86NuWglWqiSk5aAHLemBvEG4whatry4G6Ku7eGunmtRCIz+oy/eAXCqZTP2X/MZFU9V6dNDUbE2k0bWMUPxhl7S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C+1Ohl3z; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C+1Ohl3z"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-532e9ad9a1eso208271cf.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 07:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790173876; cv=none;
        d=google.com; s=arc-20260327;
        b=KjC0gVyo/+MMG46re83nUx98E23csAIjXlseW8idGCnk7GSxk/0Y6WlzmsnnjVh4eK
         7XTZFJ1Cfz3tu1ztpDWd8nrtQjjRk54AlM74T9q9MTUMmhrB830faYzwULEAl993fDOh
         yf5xzaceAgSYcsSImqRRaIguz/dP7rS0w9SA7v0vRIhX/ztMCKVAn6CIPri3cjcMcLQ6
         +t3LlztwdxHJCJt/kRS4KoTPkoAh8k58v1yOlOMaitZIhl7MO4dI/5+lXdycqmRUBbYU
         tG9Y/9ig9U3ZdC6T5BnBDpKb6eF0pLHpTRrbdUEGsjExml4rdRZqqtWLlMtTOg0mA1O5
         VOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        fh=jTVuudbZiyZStJ22vF3Cef4NecmAMjRdfBL8wt/WyWo=;
        b=NgqnyKdqowtqT6Cw2pGRi1yCzz0B7L+otQjIVet3NheBxSkhxqRtR9cNBxm5rh2v3h
         L9WzmSVCgcaPLRti8d4rJlA0xwtRrYM2h4TI7s4VWLom+FTjrwU4Lr5P5BQTV3ejmbci
         9yTVcTiYFp3MWVS4VC4UGTld6Ci9zVdbp+r0RJdpW4GiwIWTQmUwZZD+DN7Rcn3VNYsQ
         ZFpPerIYYryfzAtqv6xEkWDivfBrOl11+OI74u5d4eBiFUSjaJIzvOO7lZcq+4YI+5C1
         AHUcuuYpcrCAkxzFuxH+MpYztrEpzPZBGGvMG1H2WLVu5B3vQVI7pYVZVzSqQ7ieVbHB
         dVPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790173876; x=1790778676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        b=C+1Ohl3zbsMrjh1dB/zOjZD8WctelSpuD7HSjz83HtCzxAu2uQCdrvdk6mQA/qDmED
         XPmCruc/0qesoh5ZaUY/8kYU55YuQDkrL+NWB4/GzBktzO6vR8i1QACk+3pme9wnGQCn
         VZQmjl8KrY0HTHromA139b+tgbWQilZ3lTmZ8bgk7A7cwz+FVWfgOIYzhOmTDxAQ89K+
         VZ5tGKKWdn2SxsyXoo0ZRNPy/7aL5Z2Tdfk7aj0pDU/c4b+4zxQCe6XqJRfIBBmHEG8r
         fY+QEIfNks1XUT2d6WUeW6MkoHO+EYXflKlYvUF0fbOWU0DbvpsKlrTvHc30tBgH/z4n
         u9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173876; x=1790778676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        b=c2Y7q4mo/YZybFft71uFsqZAX25YldAi0qiZ+it6xd6K4RZFh9LKe4tUmT9J6CvWC+
         iUDlhMUn+wJKiDfJ1Oo7Ijpt4FEOC07vxEuY/RcdO8gs89cbAvokbMfzW/xAam4lS5bh
         wG4uFWi/vyL26a+yxntk/ieLAqQY9GK3S07BGA46vhXQbdPeJ5O4OZm+zaH/q32oFRXn
         C3978yyKsIZu3579kKKYDYJ5WtLvQAXFViLTvZmpnVVSKuXgXdBHMSo5GGuFujEUaBlQ
         atPamXbqJ8oPfcSLHWr+rlWAURjnXiqoPtO7Kgkb0Xo5Bs77ZyWH365E4qWqnkT/82Sw
         AbBg==
X-Forwarded-Encrypted: i=1; AKwUvBwkRLy8OauNN+Ypm2VYvio4cZVlS31BwFX0NRoxs3/4TtVPTeWahgqeYb3GOLhYv86i+yEH+/YvTFBDnA==@vger.kernel.org
X-Gm-Message-State: AFuF++kCADInoZICxkvKVeflIXmXnIBGTp7oq1t00YJuUMkrUjxansca
	4vjvjvcebrfEDFANtKX0EeS+mhDvcXH6wVSuDdCGUN4pmz++7hH9aPm5AzknxyOFbZwtbWx0Vvp
	UKrS5t0utQyrOOUUs+q71LiAmyVA1ionUEN9TUvZ8
X-Gm-Gg: AYBFou2YofCeAnaKtbabXD22FeucWBq1enonQyziVv2w4Xyg2PXMyT7Y9FtQQc09E3J
	lBaiapY8TmXDyfXf0bSvQYyWl9B4cvfRMNy9xCI2cUk8JQDqYTUe+zcJwS7DXoNiFbNMEIBtxS4
	jdlGAHg3+CWIBgZtrGAr+Axplen6s0QDWaAdgLTfrqSuRta+xpqxzAg/3ttYF+ghnoddx2aCC1A
	3WZg5SEOF+E9t8jR28/QHVuw9YPvwOb4CYxpxy6sGRCU0gGHuwhvuDk5dsYK2l/Ki0ryRTrqlpY
	HsWrthbBHaWkvF1C7GSbHywgcf9cdGM6Tze+yRi6HF0OS0/vmm8M/yTLJYXn9VcLTTWXTeAE5p4
	WP+CLSm6sqw==
X-Received: by 2002:a05:622a:260e:b0:532:9d15:2e5a with SMTP id
 d75a77b69052e-532ede89b29mr14598791cf.1.1790173874906; Wed, 23 Sep 2026
 07:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>
 <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org> <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
 <aq6kzpK7wPl3iFGe@gremlin> <aq6lW9FvL69QeA9H@gremlin> <arOCPN02xB7mykju@gremlin>
 <b007cd0f-29ef-457a-8e44-63ab26f3bcd0@kernel.org>
In-Reply-To: <b007cd0f-29ef-457a-8e44-63ab26f3bcd0@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 07:31:02 -0700
X-Gm-Features: AclHuK_ZGTwaB8ygIyiOyIIeQNRzbEtns-G_Cds8CuZ4q61CHw7YMjTifucik0o
Message-ID: <CAJuCfpHL=dHjT=O4S88ZBvT1DyodAtCL9QTryepzs3EMwoECDQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate VM_SPECIAL
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Wed, Sep 23, 2026 at 1:40=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/23/26 10:13, Lorenzo Stoakes (ARM) wrote:
> > On Sat, Sep 19, 2026 at 04:09:13PM +0100, Lorenzo Stoakes (ARM) wrote:
> >> On Sat, Sep 19, 2026 at 04:05:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> >>>
> >>> Thanks guys!
> >>
> >> Note v3 has been posted to fix a stupid bug in 1/40 + attack some very=
 trivial
> >> sashiko stuff
> >>
> >> https://lore.kernel.org/linux-mm/20260917-b4-mmap-prepare-vma-flag-san=
ify-v3-0-4583d8a23bca@kernel.org/
> >
> > Just a gentle nudge on this :)
> >
> > If you guys or anybody else has some time it'd be appreciated! (obv. th=
e v3 as
> > linked above not this v2!)
> >
> > I know the series seems intimidating but most of the commits are very s=
mall and
> > it's been in -next for a while.
>
> Busy with too many other things sorry. Its time will come.

Had to take care of the pile of bugs but I'm on it now.

>
> --
> Cheers,
>
> David
