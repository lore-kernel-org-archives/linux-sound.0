Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930E38BF60
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441717; cv=pass; b=CVjJBiOGr9SmuTN6lJYI3olVjguT/EuWIiNf+ev9Gi70zj8fVD9f1DuP9z4uws0XpcBaIzTpM/kTzZAWmVSXhV9SVZWgzx5yiWrtYXGs5Qcw4cpxONlFG3JkvwGNsXB1+EJ8dO8nWYUp1R9xUBlhZ6iJ4OM5QBXIXDy63czFzeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441717; c=relaxed/simple;
	bh=bFpTLNONMCtq/hflXyzdrakhOOHzGsAXXxv5XUvHc6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omlGl3uUBU23rS+L/mtz9soes7TCZfmA/UlbQpNrOP2HWSj1oJGV9dxQ9fN0ebnmQGMKAEpqo4Dfe/LD4HkIEf564ptF2oc6Y7qnxbhk6KDsoWfPW7L1EWjwRs8DVi0EVTw9lmwFsucegCllA21B9ePIs8rE22eCheCPuND7jyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLcp4fjs; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLcp4fjs"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d4c7d04890so3958674a34.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 00:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772441715; cv=none;
        d=google.com; s=arc-20240605;
        b=LywuGFiLOwFBZfvfsWDZ/dPM0CCxrULZCtAB3vHu/sJB2Y+69c3MVN0laBJqIyQu0D
         4nbyF5caCulsoy20NyX+mh7zrsk+IeWYMFzXZhbgtkjn95KZIGltag4/Q83wB2JNndVh
         o/KvhRuzZnYnubgT3QsqybxyrvMpptzZMOvO/yVE4LoBcea1NUnlgBXnwSKPI7Leofnk
         f83Y+3b3Do4MlKdpwYeYgAOnjr21QqH0M8iJS3iBOBg5Vmi1Wm+y7Lcdq6AnRB8+uNSQ
         4SXh1v8lBkpCicVbNvRHV1ONSg2ywtADSP5nrhKjCwtKpXeqsiV3c5f5jlbYTGXg5pIq
         8p0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ePit+T4AFW9LmVvwSqNQ9rEOMAXI8L897EaFC+SIDkg=;
        fh=jsvWox3q4bAl4O3+pQ8/G59ONOTkI3u8FX+ZHxr7ytQ=;
        b=PYHG7Tpfer9ClOVAm5LJhovEDmIdFLWPcfA4N0kEMUa/dENRCxUdRs2awIT7B/W9T2
         fZ7GEmDOpKe/6oMXh6iBLn02N+5E1ZsPzh7Zd4OP9MjJi4Jplnq2+cBcNT8DDfbssm58
         r6OTsKrkDf7NtHf5515hSfQ8Ig2wWxPJaglbE9r4MgZbszzNGZx7eJ6rhmy8z2ElQsgD
         ST6sX6n7WJYKNvX/it/ggSHbrswKzxvYBJnfEAsaMQlFUcztJODmI48l2xESiLnRsCXX
         Go8qagRljK4gHoKjyABtH3EPBIG9yjuzik0+iLiHABTV5KRYbdbWHcQokOIPfPlkMheq
         ti6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772441715; x=1773046515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePit+T4AFW9LmVvwSqNQ9rEOMAXI8L897EaFC+SIDkg=;
        b=PLcp4fjs+mIqjl/yN0Ko9QvKE7iPRmNGo8QohIukOXiu/PTvlxChDMi5rZ/MPygrsG
         U8lSQQJOQjuxVcghG6DkxEicrqP4W6F6Ak2RIHFX5+ZYq43WBILPPEm+JXcLxr8qhx3s
         fYVPSPdAGr03YjfS9E+tIGI2DmNLqFfI7/la8N1bYOER7fEA84B2boMW687Dyb6dsE+j
         ZWa3UQHg0Bkvyzjoyjd4dYFnSmuSfjmZ85JNHFVN9kTIKx+hQcuJlsxdAduLCMjQTWX5
         DGEvs6Ca0TL+ApoIvgnux4AL6FTOmHF++hWRB1Uz6bj1ll1diD4aJ66Afexena3bRUZc
         wucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441715; x=1773046515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePit+T4AFW9LmVvwSqNQ9rEOMAXI8L897EaFC+SIDkg=;
        b=L38NPRG06mUGuqd8OMUOnFt2wLIfd9M6T38e5obTFeywohc/arv9TqweA4eOumQmA2
         cfytUPsrr30b/4RWxQuOi0yiFqiTYx+VeGSyRzbcf07qzAenn+rp1rXYUbItglLKbfdj
         nWZ+GzzBe8GspxjdICMdxKDhuon+fsuVf+YsUgeDfyG1G+po9dJ4RDuA0QwRH61oKD9L
         PwVcbEqtOsH/EFqaUrRHNA6AVFLO/rgtxdtlZqCwvN/lYJp8Ito3sK87iLHOCkesb/qE
         m9QsClHz31kE79s0FDF63Oc90MjjmZglszRw3AncZ+7sSSTQ/rVnjr1e/muKCOjQht7R
         +hbw==
X-Forwarded-Encrypted: i=1; AJvYcCUsEPAMRS8Z8UFUNQ1EXUUr/fWWVUZtDcGXv2dT8OCN7LkswPBZnlS5uTklfwSdKGoAhFG/RpYkdGMKlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFbkKDZB3te7KdoYtKIRBaohxVLbHhkdm20viGAtjEyfyWZilX
	aPm9Leq7VpjBUyDa1xHvJp9FFUuAIri4RHa9WIGM6zJX48JF2bn8xxiWVvuQkT7ENOm0HtRmSIb
	BfHnbJ5rNKRB1/yNSzt7uWpk1rauRPQQ=
X-Gm-Gg: ATEYQzysu0Df2bxZ8U09fg2eHGOp3Ss/k/9ur3L9STLsdmTFOEXJ7rDsn0ByX5za/Jr
	DnAqkyiI7PAvIvOcz70H4OHOg/Mr3VsI2YVODJgCc0Byq/+LSQarke8PT6yi5mo4C9SvsLsQEiV
	VH70Uw/XfTd2jR7cG3TstFQJ9x5PZTxYWsu34Cvr5d38+bcTqmjG08Pu3dyqZboQx1H0ySxFmjM
	ccGpPNEc4fL/LUuKa+/xTL7O34hPjLy1osi6mS8wlsSTjMnaJ6gHeNLCqc86j8uKD9RUX1vjMf4
	rxDsAns6R/6V9cTUpxtcag0CA5W+Dawpu8THucwD0yFtvaeCfHJcz0a23sZBBkolTtGJiUZ4EZY
	=
X-Received: by 2002:a05:6870:330b:b0:3d3:d18f:8920 with SMTP id
 586e51a60fabf-41626fba307mr7800002fac.31.1772441714550; Mon, 02 Mar 2026
 00:55:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-4-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-4-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 16:55:04 +0800
X-Gm-Features: AaiRm51xUTuS6Qp9H7dqDZ552mwa44_EA1IClTLmHMV7GPVb6Uir69uksp6caw0
Message-ID: <CALbr=LbNE+aviHf+EwZNohzm86skWJu=adQsHaM98vQyKUAyvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] driver core: platform: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 8:28=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
>
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
>
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> Fixes: 3d713e0e382e ("driver core: platform: add device binding path 'dri=
ver_override'")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Looks good to me.

One minor note for the commit message: this UAF can also be triggered
from the bind_store path, not just __driver_attach(). It would be good
to mention this as well.

Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  arch/sh/drivers/platform_early.c |  6 ++++--
>  drivers/base/platform.c          | 35 +++++---------------------------
>  drivers/bus/simple-pm-bus.c      |  4 ++--
>  drivers/clk/imx/clk-scu.c        |  3 +--
>  drivers/slimbus/qcom-ngd-ctrl.c  |  6 ++----
>  include/linux/platform_device.h  |  5 -----
>  sound/soc/samsung/i2s.c          |  6 +++---
>  7 files changed, 17 insertions(+), 48 deletions(-)
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_=
early.c
> index 143747c45206..3cd17bb0be67 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct =
device_driver *drv)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct platform_driver *pdrv =3D to_platform_driver(drv);
> +       int ret;
>
>         /* When driver_override is set, only bind to the matching driver =
*/
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> +       ret =3D device_match_driver_override(dev, drv);
> +       if (ret >=3D 0)
> +               return ret;
>
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index b45d41b018ca..22ae87921a7a 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -603,7 +603,6 @@ static void platform_device_release(struct device *de=
v)
>         kfree(pa->pdev.dev.platform_data);
>         kfree(pa->pdev.mfd_cell);
>         kfree(pa->pdev.resource);
> -       kfree(pa->pdev.driver_override);
>         kfree(pa);
>  }
>
> @@ -1306,33 +1305,7 @@ static ssize_t numa_node_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(numa_node);
>
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *=
buf)
> -{
> -       struct platform_device *pdev =3D to_platform_device(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len =3D sysfs_emit(buf, "%s\n", pdev->driver_override);
> -       device_unlock(dev);
> -
> -       return len;
> -}
> -
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct platform_device *pdev =3D to_platform_device(dev);
> -       int ret;
> -
> -       ret =3D driver_set_override(dev, &pdev->driver_override, buf, cou=
nt);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> +DEVICE_ATTR_DRIVER_OVERRIDE();
>
>  static struct attribute *platform_dev_attrs[] =3D {
>         &dev_attr_modalias.attr,
> @@ -1377,10 +1350,12 @@ static int platform_match(struct device *dev, con=
st struct device_driver *drv)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct platform_driver *pdrv =3D to_platform_driver(drv);
> +       int ret;
>
>         /* When driver_override is set, only bind to the matching driver =
*/
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> +       ret =3D device_match_driver_override(dev, drv);
> +       if (ret >=3D 0)
> +               return ret;
>
>         /* Attempt an OF style match first */
>         if (of_driver_match_device(dev, drv))
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 3f00d953fb9a..c920bd6fbaaf 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -36,7 +36,7 @@ static int simple_pm_bus_probe(struct platform_device *=
pdev)
>          * that's not listed in simple_pm_bus_of_match. We don't want to =
do any
>          * of the simple-pm-bus tasks for these devices, so return early.
>          */
> -       if (pdev->driver_override)
> +       if (device_has_driver_override(&pdev->dev))
>                 return 0;
>
>         match =3D of_match_device(dev->driver->of_match_table, dev);
> @@ -78,7 +78,7 @@ static void simple_pm_bus_remove(struct platform_device=
 *pdev)
>  {
>         const void *data =3D of_device_get_match_data(&pdev->dev);
>
> -       if (pdev->driver_override || data)
> +       if (device_has_driver_override(&pdev->dev) || data)
>                 return;
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index a85ec48a798b..9b33df9967ec 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -706,8 +706,7 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name=
,
>         if (ret)
>                 goto put_device;
>
> -       ret =3D driver_set_override(&pdev->dev, &pdev->driver_override,
> -                                 "imx-scu-clk", strlen("imx-scu-clk"));
> +       ret =3D device_set_driver_override(&pdev->dev, "imx-scu-clk");
>         if (ret)
>                 goto put_device;
>
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index 9aa7218b4e8d..1ed6be6e85d2 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1535,10 +1535,8 @@ static int of_qcom_slim_ngd_register(struct device=
 *parent,
>                 ngd->id =3D id;
>                 ngd->pdev->dev.parent =3D parent;
>
> -               ret =3D driver_set_override(&ngd->pdev->dev,
> -                                         &ngd->pdev->driver_override,
> -                                         QCOM_SLIM_NGD_DRV_NAME,
> -                                         strlen(QCOM_SLIM_NGD_DRV_NAME))=
;
> +               ret =3D device_set_driver_override(&ngd->pdev->dev,
> +                                                QCOM_SLIM_NGD_DRV_NAME);
>                 if (ret) {
>                         platform_device_put(ngd->pdev);
>                         kfree(ngd);
> diff --git a/include/linux/platform_device.h b/include/linux/platform_dev=
ice.h
> index 813da101b5bf..ed1d50d1c3c1 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -31,11 +31,6 @@ struct platform_device {
>         struct resource *resource;
>
>         const struct platform_device_id *id_entry;
> -       /*
> -        * Driver name to force a match.  Do not set directly, because co=
re
> -        * frees it.  Use driver_set_override() to set or clear it.
> -        */
> -       const char *driver_override;
>
>         /* MFD cell pointer */
>         struct mfd_cell *mfd_cell;
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index e9964f0e010a..140907a41a70 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1360,10 +1360,10 @@ static int i2s_create_secondary_device(struct sam=
sung_i2s_priv *priv)
>         if (!pdev_sec)
>                 return -ENOMEM;
>
> -       pdev_sec->driver_override =3D kstrdup("samsung-i2s", GFP_KERNEL);
> -       if (!pdev_sec->driver_override) {
> +       ret =3D device_set_driver_override(&pdev_sec->dev, "samsung-i2s")=
;
> +       if (ret) {
>                 platform_device_put(pdev_sec);
> -               return -ENOMEM;
> +               return ret;
>         }
>
>         ret =3D platform_device_add(pdev_sec);
> --
> 2.53.0
>
