Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65B4D2EF6
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350965; cv=pass; b=Y6UWNNisg1axk9aYqc6DgCvx+XQL/7l6dj506dIV9/Ch4/6NIzEMJorYtkARf9xzmD8dye8ykKfIehzWuVZ6XdfovFPXC1GYpssKWXdnsZXmQbD2s+IO3obKNFHFpstsnJVxcF1Tw5Pm+QVKCo9s5MRIcRFDHFQmv9RJX68oKDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350965; c=relaxed/simple;
	bh=mmwxA1Qc27WddHPOxjfsi9qP+MwlgkxmC3KjpOPgTJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgYNKxvURa5VNCByuuS+vNAlBmvrz2u3o44qDR9vyu5qqwmieAeud8eZlbZdobGNRioecSMAKUG7/0PuLpzb5wERrjwjRgDGN2SWJwZqUmR1RYOvyX0enqkHeQ34iew5TkptfZ7vutyJC7U3FSPsx8eAuLvZhMMPgw5zri66eHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qqf4+gtE; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qqf4+gtE"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so363056e87.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350953; cv=none;
        d=google.com; s=arc-20260327;
        b=OqvHHqMTNjveMx8tS66YrZFzV3a1XAepQCpSgsmQ4usl8prYJDKI4e5pSNmNf7TBiQ
         Lb0vbEE7B6uYsIi8lHB7Y/zOaeHJx2WoDaH7fD9yOvsQDm4T7z7I344soZ+p9zAmF815
         re5gFOv5rQLwr2xV0Nu8Erpnu8SvvkaEvZk3Rj0RBlNtO7rgFtm8dM/oLtt8dFRLkL00
         EMJk+WYtVRwNTXkzpnif8AGXIIQbF7mvtY7p+TyHP3UdSSmu2GX/2cgjXipauSPj9TIL
         GBGPRmadh7ofCteV7MpozqUFxDPYqzfBP7jLw7bCmmGW4p/0ElbBE5fmkgPYASRyEeS4
         K0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lU8qhn0KHh/NjdXVEI94/uagsar860Baf7zBNg1vPEQ=;
        fh=l5G1ub3i7fnVnzbA/wbSsF7PClG9Tvby3AEMKlJf/mk=;
        b=IyzZXzWJfmQfnM+OZR+qtwxOuJ8g+po9V59G3sHWEeioYkOo1pUJEp9BPC5+x313/9
         dqgu5cg8aoNt4IrYg6T2fkChKXZrK/daDwT3pxJUPhLZpcAXL28MtE/Gug8dwl1g52Ws
         5vgXbbIuqqg9doNPk/LObaAuh2ZsZBinoZ5qFnpIeGbN+n2RYbcWc6KJHI+q+sN2CMKx
         jJRzSnThJWv0ySyOmFAsAPVa1PIQAXYUjCpYQZ1QY4irvvfdaRvPROsyOe7rCQoLKzDJ
         Vo+zdhscM0lOZ0dfOe9FBPTXTrNPenBvngADkqBfALrPGmPdXxHos7RRtk35L4P68+XA
         a1iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790350953; x=1790955753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lU8qhn0KHh/NjdXVEI94/uagsar860Baf7zBNg1vPEQ=;
        b=Qqf4+gtE9uNY7gmBVGOWHJq+WjlUweFukCnYti4BbBjFNuQ18mEXrYOKAOqAFDoOmP
         ypEOR3XlRzkzrLDRlAgZgaje4gv5xwAPIN9FbCez36uju46A0yyYHIZEJWtT4ndy3bFX
         UTZYBQOEf6W7KPTfExrmUC+6HKQC2PIFcuQKj4EabE5q348qkafyqka9Vylag868zu90
         mwIk9rdAGQ3gxnXiaYmOvJBZ4ACK6hqy0k6T0jGQPSWmUTrVV0FrEIyh+k+ojBq0HOlz
         iV5CE6F3qDRFjZHRyXEZWvsBK8qKx9IWe3M6UlKmRs5Y8nXEg9mjmIPcBpOnDsTr8UwX
         l+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350953; x=1790955753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lU8qhn0KHh/NjdXVEI94/uagsar860Baf7zBNg1vPEQ=;
        b=z6K95M8sWxHuHjeo+Fis8sJrZE/xQ0F2hL8uGQ8i3B/omNRa/T9n5u+13xbjnSAHFx
         fwMLE6MWKq0I86l6aMg5Pi6HrFIyeW5oXfYUqLoDujpDm/nzKu68Iwsh7NMm4OcwgfMp
         d6Sz6eKZzvEIIMFAigYdjxkXrgVZMG3vFbVCrt12BGtsWEA5cgKe3Hp9GbbUlK5SajM8
         TVCeqSuhjF22KIDF5VrvQsRsUlQU+wsLbP8H05fUqLo2eGa4iqXF4x9c2MJNInGH0z0G
         4nQIOuHi1ZJos5lnFOCqETeiLw7C4wefdQNhmPymB4m2u1ETbxYVzH1QRLtLkt6ok+lp
         uiWQ==
X-Gm-Message-State: AFuF++mg1Wfe0TYfeqwY0Fsq5XL2WMrX4nn5hCmtbuWdbySs9fb2DmuZ
	cRm1IiVzMwcXTq4kiFUrzh/n3hjFJJWxMjeX1cAR7OEv/v55qpkfD5syHp+/w3EkFCdlUp7+wam
	39nFZKmyiFOJCivlAHw4xrT8aO8qlhjA=
X-Gm-Gg: AYBFou3fSOaHnPOo2oobppLF1jk41FZklXrt8cYgq8h9SAv0WJuWZeHgJ9ba5ohgoXK
	g1a0fTsS1h3Hx7rdUuYVGas8BJELBO8dAa2MFqoJGo3Lhvyf9zWuKdqZ6Ax9Yjzj+2IrfAEk9sT
	n63Exn6Y77ClOtMAte/Dej/ETxN09AKXvK8e0l54pZYKG3gDMH/L6pYv07ZayfKO8QDe1FCTYpg
	1JR1S22yy8fgwjjkIB4QJbwgzI3uFZzwcVH5wgF4zsclbJGqOGbRcfesSNkT4Vjg2b71uR6sY7H
	07GcWwuWSQUaN6cZO4nqpxfspAEPrmnOHhSexW0Ywemmk45AUEBPQffybA2804Jx7DeyXEhZsku
	OX7GY/0q8Tl+zZbvRr0Z6xa9YFUNFMymwDlAyEUN42Aw=
X-Received: by 2002:a05:6512:64c9:b0:5b8:5e0c:e22a with SMTP id
 2adb3069b0e04-5b8df09c14emr1320931e87.1.1790350952692; Fri, 25 Sep 2026
 08:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com> <ab6f28d6-4ce7-477d-80ce-ba076cc1b025@intel.com>
In-Reply-To: <ab6f28d6-4ce7-477d-80ce-ba076cc1b025@intel.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:42:19 -0500
X-Gm-Features: AclHuK_Q_dLVZMXu2KW5SvoFLTRoaPvRyceVifNOnVEkMwHgGxGrQ98QdtZKYOE
Message-ID: <CALHNRZ-_d5vHUPjz88O8OT1zAmVu4G0cEr=JVRhGO6upyqWJiw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Weidong Wang <wangweidong.a@awinic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:35=E2=80=AFAM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 9/25/2026 9:47 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Codec drivers are not supposed to do anything like this. The result was
> > that the first second or so of playback was essentially inaudible, and
> > very short alert sounds could be missed entirely. Let's not do this.
> Do anything like what?
> Let's not do what?
>
> With all due respect, the commit message found here is so vague I'm
> surprised people even review this.  Your change is not a one-liner
> cleanup.  I'd expect at least a short description provided, on what is
> happening _currently_ and _why_ removal improves the functional
> behaviour of the codec device.

As mentioned in the cover letter, this series is a direct copy of
changes to the aw88261 driver, which went through three revisions and
was accepted in this form. The matching patch is here [0]. What makes
this worse than the already merged patch?

Aaron

https://lore.kernel.org/linux-sound/20260529200550.529719-6-val@packett.coo=
l/
