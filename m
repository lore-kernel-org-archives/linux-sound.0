Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BD2417F8
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578209; cv=pass; b=tZ8UxO4h+0gRQ/lChipJ6X1o1mv/q9kHEmjjZSjhksx1K8DqhC8CtdmS0Ov4S6nBn18RubfanxdoTWrUgtdxWqEctqgO3GTwL8Kql6lfzpiNhN//UOOq4IYB/5Dp+n9QzhRIwUHqpiT/Y0t5/Svh53p/wIk+99Qb+PywOxdHRNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578209; c=relaxed/simple;
	bh=xpweKa8+RmcNfzvGpSVtZUlK5Ee5MSAToPpeyWxLgM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TMQjxb53ZUVP7SxYYLcuuLZCSU/xb5/WM6Gw45D7GcNigK/LrBaBaPQR14B6UVTWNg//nLEVCBJqWXe879cQwhcq81N+zRZLNxNNMMwkA7PtCPulZNOuMl8EF/LeSi6RjlXXH72X3gCIdUPVNZJU8kza+GzQUyx+fYdMUhgH+Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de; spf=none smtp.mailfrom=digital-rabbithole.de; dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=FMNSKdNx; dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=ft4AIMjT; arc=pass smtp.client-ip=81.169.146.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="FMNSKdNx";
	dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="ft4AIMjT"
ARC-Seal: i=1; a=rsa-sha256; t=1749577843; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YJxSgRq2cQePfBebqJu2NEsDEHt1RPTjmXbi/GrS7rM0aumhnPogjQVONbta8+TK5b
    OOVdCdBT24PTzKPjM30HZ/aZqEEvhvk3nd3zpk+VOW4Ivm6hPJUw4u30/4K+K0aBy8af
    ye2msVVRBjU55zkttPoNk6guVoVDCbf2+b6L//ZVKOuD7AC9T6RJ65gPBQnPR7UycaYB
    Nixyerod71F0X3r2PMNSxOjSO5FRFnEipQgX4kLCUk7VSZhfXVbGqJxJlSh1XAnykouS
    NJWMCTpXP4lq1/ztN81lYSoa0hjQChA+uFF/uXioeknP8v9DyjTfEautFmzuNPVzj/to
    w1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749577843;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Nkoau3N8uuLAUJKS/88PTz6t1pGKSzUrseaw6F8M7tQ=;
    b=pwR7aYNDSF06rJ09CrHE+dU/9Mt7B6sXabevG77Zu1xKZvFsNRngRVcB5yglfzDF/M
    F9XscWmgNA7V04l1dZLKyhBXrbJA6y0V0NHvypa5D8J8ChT/5EaDU5+LJV00rrjyBxq3
    za+T+F3//O7oJsO6jzHcsbtZko/V2+UTn/XCRtHqGbzUCxGKiq4tYgJd43D18OOVQ9Rh
    caZAKmvqwrNc7vXG5sk0wJQ+a819Y5JsTmkdq+IpKgeQJJ03kXxynXCpLIc9lAbXvW3w
    EH9Jl9gfly6cCBDZMZS9Fl69Im2Prn0ZOfMjBsT30IQbgM6Q9zBI1+tBMkY4/C6K296A
    rz4A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749577843;
    s=strato-dkim-0002; d=digital-rabbithole.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Nkoau3N8uuLAUJKS/88PTz6t1pGKSzUrseaw6F8M7tQ=;
    b=FMNSKdNxbKT59BkLSuUK1b1XqIjnR9Tpk2AuY/3Olm0LVSXqiC/MHooaIfXOw1q+d5
    /siO0cGZ7/XUa7vGxrqrVYR43E8qEyH1kJ8Bw6/zZFzCwz9U5DmEvkmg5o6W0dndAtLu
    xkiOOFNWu39DvVCRwEEKl1CQt82G7siyfmhOGjBw0mOQdhDQjWAn5gFu5k0sfIgPSFih
    923Y/0VIWB58pVUYTYcDbf4nYpxTT2VBVuoO7jqwJOU9HWUmgqfgp2LJOnUeaoe8/fbw
    j//VfkGeWu0ph0seY/wCIMjbNUgh9rEut11SJSEFvEnBgVa8CaIJwulf7c6SwhjLPXbe
    s1IA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749577842;
    s=strato-dkim-0003; d=digital-rabbithole.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Nkoau3N8uuLAUJKS/88PTz6t1pGKSzUrseaw6F8M7tQ=;
    b=ft4AIMjTH3QO52p9gKekdX3Bjma24P9eaN+7sV4FotH3HHyAEGN7EJyr6MW36YUjWr
    jK66dzTuep8rSClXoYBA==
X-RZG-AUTH: ":IHkHbA68c+1zn2gb8+6dxsBP09h2Do/Zi4V+rbxtNBl2hCipBO6GPyNXZ6xAUEuHlZnKbp4UbhpDgteKQ1Dc5rYYRejjsEqb4WrQK85vHAG31zgy+09F"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id Y1c6d815AHog2d0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 19:50:42 +0200 (CEST)
From: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Subject: [PATCH v2 0/2] Regarding recent patches
Date: Tue, 10 Jun 2025 19:50:10 +0200
Message-ID: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Hello Takashi,

Thank you for the response to my last patches.
I've created them in response to the kernel test warnings.
I apologise for the left out description, while I have experience with git,
I'm new to using it via email submission and must have not realised after getting home from work.
I hope the following patches are suiting your requirements better.

Regards,
A Linux enthusiast trying to get their soundcard to work without having to deal with dkms after every distro hop,
Lucy Thrun

Lucy Thrun (2):
  ALSA: hda/ca0132: Fix using plain integer as NULL pointer in
    add_tuning_control
  ALSA: hda/ca0132: Fix buffer overflow in add_tuning_control

 sound/pci/hda/patch_ca0132.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.45.1.windows.1

