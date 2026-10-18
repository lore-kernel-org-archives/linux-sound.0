Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B062D36494B
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292353; cv=none; b=jZbuAAA8ttO+aW0Gws/1rynUuUj+Yv4XOKJXOtbhZgX9T4/wdLcfXMijmHl/abLRE9k3WpTfBbJORfmvDcqHIK6YoblECKLYjp7oZVvMlL7q9nDCLCZZ+GI8YKzEKerfc6QHf0/g2prU8f1y+UpmVSZ497C7ZFlgJIbw3BUYzU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292353; c=relaxed/simple;
	bh=xOT2xhgG4HvHxboNomCCB8zMtEcw47CfY+5UMisvHbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGLl8GP0IJTYCQCaQNapH0S8Sy5i08TrzBI38YFlH4KBI2ernFFx9jSeCgUCIUDyQT4v0MkNDKiYpLefmQ5BHe1XXNpCxgiSZdK2QF3BA8n5QfjeOieaqDIkVd+RETiqlQLalxCh7zf672B74pWuc8v5ZYhemyaaMjzhGu76AVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr5DoapW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr5DoapW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso839156f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 19:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792292350; x=1792897150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOT2xhgG4HvHxboNomCCB8zMtEcw47CfY+5UMisvHbk=;
        b=Pr5DoapWgRT9SxZuQfvGgKwDD54Bgj9H/lkAtLlLj6X8Y9Q35ZZtTG3XYeU3Z2gAeY
         j0/KjqBz0V7YKSls9+VcsGJgoI2mnFbOSL6rqcJe0VYQ1ew08YpY20sowe+XlLawcKMt
         AISEQ0wo7p/IxtUfSXUza/xall1bFEz7g1o31SAFuYt4RUz2L9fyGkUTELJ95yr4NPGI
         gagxKmyQVSB3MWRdGX80thzFoVd+oRN1lDlYowAnvVo8c2Z5cuesWnD55UOgMEhNdCYd
         Lo5ui0TQMSRrez4N61wbNU5/7oYqsn0wvTlfEjr9+jOnYvXYzPm0LxDeB/HTQz/Z0U5v
         Pbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292350; x=1792897150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOT2xhgG4HvHxboNomCCB8zMtEcw47CfY+5UMisvHbk=;
        b=QgqQdDCiQSAC+q2ZtBITUj4Qvpj6G4p0aCtiM1Ofhs7M0ZXxo35KEELQZ9T5CoWAo3
         pGANnP4wO7m54sQa7ahWB1A7uya5RW0xIDkZYYrevBpzVAEROPI80JTNd+wT88aHiX4B
         XdNYFkKH9ptVSYYdnRJ+dXOlZjg8tXY1z61CJLMy0T//hZpNbYvlQJY0n0NZiJ+yO1L9
         ac3VZ7iLi/b4x11b0tQumOElh4UYL/Rjz4oORnvDcKLQcYARkXjhMWW8nkGHLbRGUQON
         m9SUG/3sXdmDi81TizAm6kSX9l7EmpBU8MZ8DBzOic8kmJcyRKYMOKjuP+8+4bPEMBFj
         DZPw==
X-Forwarded-Encrypted: i=1; AKwUvBxYDDJyu2emiT3ZfC5RJ/wiwOGTF5CJy74nGB9YyiYZs04yjJFiG+4eYpPVNJXqHrQ0kW8oLQTzSYInQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZSUj+7bh54v367X0invmDm/42dZSLZ1kVyENmcux+LgYiS00q
	z6AW7WGnd1HuOePU15qr+iwVNh03nxn57wbWhAuhZiaWLHNrdz91S30w
X-Gm-Gg: AYBFou0J5wpQkMS/KkdR0sNop+eoawa9oPqlmT0cpnIM8a8hTacuB9nWq/2xsqDXRHn
	0Bvv3rbTx801a4Pg6YSBQDVk2gRYDLxBQggMcYoXHkNTWWqF9SkP4TjqiyXhKG7/QM67tDP8GcX
	Ico7u+oefe7f+N2S7Cx40nE2/kkNcZ/5mfsrfSBgp7IYCWKGwysU9QgsIpgt9q6e5JnVZEvXhc9
	Gm3OzL+3izVRX0BJuM3u23+dT5YAxLQDPTr6J7yYnAftcUyAZjmO0AZM7bkd2CM6HrBK9xv5egZ
	K+qdvClZ4M2fHxmPJtx2fQbeg0e7+I4Yzu9UvJMfy98Emlk/IkQUYlGJtBEjvYInAsCQbp8gs0o
	DuYE//6nDzyvnMEOAQDX018MCTJ+bXAYL+5n71TTinDzKli5Z6dNLR3ZVaFNcTkaWODI5WvctZm
	M3Cjms1azLJYpVLHN7xlonqzAYSfggoc+j5b9noaw4MkBr/QRTKsDCfOfAjwVmai61RqAkj/zA5
	g6z1OqqDYeTheYWwf6oxXqB8IkmOfIGAZrKsJQGOY6ol3PTZbNAvfzIwNAMNlzHrDATlw==
X-Received: by 2002:a05:6000:2c0b:b0:48a:f3c6:7bfa with SMTP id ffacd0b85a97d-48e07fbd825mr6459320f8f.52.1792292349489;
        Sat, 17 Oct 2026 19:59:09 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm14785161f8f.35.2026.10.17.19.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:59:09 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kazuki Hanai <hnkz.64@gmail.com>,
	linux-mm@kvack.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH v6 16/39] mm/vma: only allow mmap to clear VMA_MAYWRITE_BIT if not mm-managed
Date: Sun, 18 Oct 2026 03:59:05 +0100
Message-ID: <20261018025905.201296-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-16-1aa3c9b139f9@kernel.org>
References: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-16-1aa3c9b139f9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

I think one site was missed: usb_stream_hwdep_mmap() in
sound/usb/usx2y/us122l.c clears VM_MAYWRITE on the read buffer since
71c610aeb177 ("ALSA: us122l: Prevent write upgrades for read mappings"),
but sets neither VM_PFNMAP nor VM_MIXEDMAP (pages come from .fault via
vmf->page, like the PCM status page in 13/39).

So a MAP_PRIVATE mapping of the read buffer, or MAP_SHARED on an O_RDWR
fd, now hits the WARN_ON_ONCE in mmap_validate() and fails with -EINVAL.

The VM_MAYWRITE clear is a security fix, and the VMA must stay
expandable for mremap(), so converting it like 13/39 or setting
VM_MIXEDMAP seems the way to go.

Found by code reading, not tested on hardware.

Cheers
