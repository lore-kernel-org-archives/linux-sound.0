Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C9385505
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440598; cv=pass; b=NMB7Ist/RYaHjk2b2K7LYfRC0aNVmDoqyX9eICcKVquNYsl8hXBqh8XZhBtgtP1k3LjviEXamevWICPN2YyI8axtdH55kjBUC0CXG6E1oGoAhWSkYPjXPvZl+B1nqo1l+mpB223USZ+Z0qwaidqMKfzKb1U8Wc0UwZ8lF2Kkx4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440598; c=relaxed/simple;
	bh=1GZQSHitluQNTjjmJ2I4j/0ggHOUPtN+HUcjzFFw0es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfsB/foQbsv5Aomk78m3tMDGw9z5E6z2g4GU0JQ7VWlrNFTOKTI2LBrzXt6Xw4pcKE2ygUyGH6YYJIyU5uxjl9UXYor962ooXP5OmpPBcI0d5R3yebhqepHFAXpD6AG92vm6g+10lo/thwq7oUBp2UmcDiCRDLOkaF2Uj5meXM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKyknCBv; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKyknCBv"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-679f6ee3fb0so1759414eaf.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 00:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772440596; cv=none;
        d=google.com; s=arc-20240605;
        b=exgy9CjLgC3tgdMPJmx5icrnoRm9hEcpzrkZQbk/J1tpqkpxvQL2Etr4QBWxMI4qr6
         +D/psIUVWvE9XWbrbA7P8NYabhWxO4sMl/ynkx/yG3u2oyWbLQdNJlyDwO4YbraTemtA
         UUU9QShcZCInLE0y7LCNZ4jtGTHiejNdQBzK4m7A12k+WLaOwtIBMCGA9TI7VsawEF+M
         6N4tDfB53kmEARIgCA9vQNGHNgjDXTmgJqoQhyIikfLJDMlGSuBidkhit8MBXEiGqoLP
         TSG8mK1if0msYepgkLJRP5jAGYW2kAaIYvkJ9CRiodRkeFAyNBMVtoyfZY3Ge4JzVwwe
         V7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RJ2NNQwmgjk+we0fjyCXc+/B1tN8WZHhhsi0KDBtJrA=;
        fh=+0MdyihRR06MvRN4/4ibSevJB5Ui8KUDQwga6sEt1Bk=;
        b=g1PQbcUSd3tV0Ap7KgZ6h8qdRQenJjm6ThtNZtSjjnrYFjTs8TObWrMxK6x2VZsWxG
         JAbVIj8mGrK/nG/bTHo8bvjrDgVWRq/OFWO7jLyK+z07b4HgJlpjDdLJt3vJAt+dNvXw
         RkQii4CJY3I7182RB4rlOugIaUN/FjZUY2GGR7hzJ2hFlKElSHrQmtTYSRIgjWCWIYE0
         5DJX9BZI1Oog19PveIdwqfaEhYDD9PJOVuCcPAMjP03OXLyrDtoamaJ5qywDaZkXCUsF
         6sQL8d2UZfdSuNqX9nduYZyK80AaN0fe16Cf9pjTMQPWr9KzcEwZJ8MuiwrHHxhUpJYb
         hnjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772440596; x=1773045396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ2NNQwmgjk+we0fjyCXc+/B1tN8WZHhhsi0KDBtJrA=;
        b=EKyknCBvZohZ1myTBk6swdhxhfDdDvnH398QByv7I7TAMOsN+Dq3ZKmtfvXTierQuJ
         C2UglWe6MkU5pcwq+ldOWKFFmQVqDFDLS3+uSgpDQT041tGp+m1wMiAMdzTdtOq/ajqZ
         K0oaAfA3mde9EUQ8TwhplZAOL+MGA/SN6vuHJtgoghYCathP84TAv/S1Wt/jVNHOJVlV
         qiO210qO19M4auEyLVlEzTiq/FyPfPbf1Ws7UHcs2ubTkeJSmb3rgbm14eNX/NBRx9mg
         MTfZ+4zJTlWasjQkqtAFKje1kVkhFzg7obQ3o8/IlEqk0YY/ctJa2nNZHv7e8Xrrbezr
         UDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440596; x=1773045396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJ2NNQwmgjk+we0fjyCXc+/B1tN8WZHhhsi0KDBtJrA=;
        b=SNdhN4rFVX/lpohLk2dchmL2ILm6eTVf8fwmikXBSPbntqJaqyPkysgAF9EpeHa3UV
         M4HyKT0kzwo7WqVTI2M7Fk3kaP1iYbP9Uwc6b6gTv3Y48YmKsoCWV+82F4SsSjhaDy5o
         SBb3TuY9FYTdGI48FjIGN03qReY4Kn7eLV2OSvkWTnCd9MDpdQwEFEcME6erFDQGqNBS
         hKDsme3O/MN7RzPubJnxdTvarLsmI1e2AeKXD35tSiS6e8DJqSXAa83eR+uutCfbtyVR
         fb90MkL+fipHyj4Kd8QnhD+il/B7ooPEkwmw01ujw3wQVlPJl5CQqaLGtXdKmUk4Bzk9
         d8lg==
X-Forwarded-Encrypted: i=1; AJvYcCUB23UM0lfOk2i6e/y/cFfnRb/8G8dr0iPKGACMbpWVHYdye+v1lcH7g9HqjOC/vSBGvvmTVHMEgyCwaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MVERMrTWbtjgIF6AQzcp8lXaaYTxth3g+mESxgvMrN5GSAh0
	dxeJSd0X63EAEdCwEOOvP+T+iDx/ogB2/ruvzkztRi+H4E0WoamY+AqRRL8xqmF/wKGxsLC607N
	nSY1Z84w8wtOWZeh0vbW4sGH1XlBTBRI=
X-Gm-Gg: ATEYQzx5B7BZO/tkIoqol0D/FFOx91Kjl/dkC0Py5sdtM+1MWYlqTnmXYgRRkNgfx4w
	BZclAYi4kZ0v6Q2jnNKRZUIkgjAMApS75a9gnkVlsTBwvf8Liy1dm/o1Z6WxMcMnMnBWba4O81+
	9R7kiePaQk8empmratE7S9K8lrIjzy8DOx3ometk/ac5nXecwvtJMysxm6XClmkhFTRy3gnw2LL
	bjh+gZ0++JuHcpQobICXitak1zVfCM7XQxcd6LqiNXtrV4WGHKqiXi6rM0hhZBK1jzDGWTbFND3
	XUmglzHjtgxoDtaUZ+bqh+hN2nx0LeIvbMKxc6dypPv+KzEA5unC3/vWGCv+hilL4hjNhldCbMU
	=
X-Received: by 2002:a05:6820:4de4:b0:667:7e1a:204a with SMTP id
 006d021491bc7-679faf91292mr6464642eaf.71.1772440595639; Mon, 02 Mar 2026
 00:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 16:36:25 +0800
X-Gm-Features: AaiRm53VKaieIbBWkzD1yY0EUmtpQaKFtqT6KmFajHbooqaebtPFWL-mvDVMBSU
Message-ID: <CALbr=LYqfhMi4eGp18r20XFzOWqRYCB8tO0mc_TAydb5cgbX-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
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

On Mon, Mar 2, 2026 at 8:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applying the following diff fixes the KASAN issue. It was just a minor bug.

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a8cb90577d10..09b98f02f559 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
        devres_release_all(dev);

        kfree(dev->dma_range_map);
+       kfree(dev->driver_override.name);

        if (dev->release)
                dev->release(dev);
@@ -2566,7 +2567,6 @@ static void device_release(struct kobject *kobj)
        else
                WARN(1, KERN_ERR "Device '%s' does not have a
release() function, it is broken and must be fixed. See
Documentation/core-api/kobject.rst.\n",
                        dev_name(dev));
-       kfree(dev->driver_override.name);
        kfree(p);
 }

With this applied, along with the PCI driver diff from the WIP patch,
the issue is resolved. I tested this on PCI and both PoCs no longer
trigger KASAN. I also ran with other debug options enabled (lockdep,
sleep inside atomic, etc.) and hit no warnings.

I was working on a similar patch recently, but your version is better.
Not returning the string directly provides better encapsulation and
makes the API much harder to misuse.

Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  drivers/base/core.c    |  2 ++
>  drivers/base/dd.c      | 60 +++++++++++++++++++++++++++++++
>  include/linux/device.h | 81 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 791f9e444df8..a8cb90577d10 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2566,6 +2566,7 @@ static void device_release(struct kobject *kobj)
>         else
>                 WARN(1, KERN_ERR "Device '%s' does not have a release() f=
unction, it is broken and must be fixed. See Documentation/core-api/kobject=
.rst.\n",
>                         dev_name(dev));
> +       kfree(dev->driver_override.name);
>         kfree(p);
>  }
>
> @@ -3159,6 +3160,7 @@ void device_initialize(struct device *dev)
>         kobject_init(&dev->kobj, &device_ktype);
>         INIT_LIST_HEAD(&dev->dma_pools);
>         mutex_init(&dev->mutex);
> +       spin_lock_init(&dev->driver_override.lock);
>         lockdep_set_novalidate_class(&dev->mutex);
>         spin_lock_init(&dev->devres_lock);
>         INIT_LIST_HEAD(&dev->devres_head);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0354f209529c..697e36e63cab 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size=
_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_em=
it()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newl=
ine.
> +        * Thus we can store one character less to avoid truncation durin=
g sysfs
> +        * show.
> +        */
> +       if (len >=3D (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends =
us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len =3D strlen(s);
> +
> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old =3D dev->driver_override.name;
> +               dev->driver_override.name =3D NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }
> +
> +       cp =3D strnchr(s, len, '\n');
> +       if (cp)
> +               len =3D cp - s;
> +
> +       new =3D kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;
> +
> +       spin_lock(&dev->driver_override.lock);
> +       old =3D dev->driver_override.name;
> +       if (cp !=3D s) {
> +               dev->driver_override.name =3D new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name =3D NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0be95294b6e6..4599156d5cbd 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -266,6 +266,33 @@ ssize_t device_show_string(struct device *dev, struc=
t device_attribute *attr,
>         struct dev_ext_attribute dev_attr_##_name =3D \
>                 { __ATTR(_name, (_mode) & ~0222, device_show_string, NULL=
), (_var) }
>
> +/**
> + * DEVICE_ATTR_DRIVER_OVERRIDE - Define sysfs driver_override attribute =
callbacks
> + *
> + * Generates the standard driver_override_show() and driver_override_sto=
re()
> + * sysfs callbacks and the static DEVICE_ATTR_RW(driver_override) declar=
ation.
> + */
> +#define DEVICE_ATTR_DRIVER_OVERRIDE()                                   =
       \
> +static ssize_t driver_override_store(struct device *dev,                =
       \
> +                                    struct device_attribute *attr,      =
       \
> +                                    const char *buf, size_t count)      =
       \
> +{                                                                       =
       \
> +       int ret;                                                         =
       \
> +                                                                        =
       \
> +       ret =3D __device_set_driver_override(dev, buf, count);           =
         \
> +       if (ret)                                                         =
       \
> +               return ret;                                              =
       \
> +                                                                        =
       \
> +       return count;                                                    =
       \
> +}                                                                       =
       \
> +static ssize_t driver_override_show(struct device *dev,                 =
               \
> +                                   struct device_attribute *attr, char *=
buf)   \
> +{                                                                       =
       \
> +       guard(spinlock)(&dev->driver_override.lock);                     =
       \
> +       return sysfs_emit(buf, "%s\n", dev->driver_override.name);       =
       \
> +}                                                                       =
       \
> +static DEVICE_ATTR_RW(driver_override)
> +
>  #define DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
>         struct device_attribute dev_attr_##_name =3D              \
>                 __ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
> @@ -483,6 +510,8 @@ struct device_physical_location {
>   *             on.  This shrinks the "Board Support Packages" (BSPs) and
>   *             minimizes board-specific #ifdefs in drivers.
>   * @driver_data: Private pointer for driver specific info.
> + * @driver_override: Driver name to force a match.  Do not touch directl=
y; use
> + *                  device_set_driver_override() instead.
>   * @links:     Links to suppliers and consumers of this device.
>   * @power:     For device power management.
>   *             See Documentation/driver-api/pm/devices.rst for details.
> @@ -576,6 +605,10 @@ struct device {
>                                            core doesn't touch it */
>         void            *driver_data;   /* Driver data, set and get with
>                                            dev_set_drvdata/dev_get_drvdat=
a */
> +       struct {
> +               const char      *name;
> +               spinlock_t      lock;
> +       } driver_override;
>         struct mutex            mutex;  /* mutex to synchronize calls to
>                                          * its driver.
>                                          */
> @@ -701,6 +734,54 @@ struct device_link {
>
>  #define kobj_to_dev(__kobj)    container_of_const(__kobj, struct device,=
 kobj)
>
> +int __device_set_driver_override(struct device *dev, const char *s, size=
_t len);
> +
> +/**
> + * device_set_driver_override() - Helper to set or clear driver override=
.
> + * @dev: Device to change
> + * @s: NUL-terminated string, new driver name to force a match, pass emp=
ty
> + *     string to clear it ("" or "\n", where the latter is only for sysf=
s
> + *     interface).
> + *
> + * Helper to set or clear driver override of a device.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +static inline int device_set_driver_override(struct device *dev, const c=
har *s)
> +{
> +       return __device_set_driver_override(dev, s, strlen(s));
> +}
> +
> +/**
> + * device_has_driver_override() - Check if a driver override has been se=
t.
> + * @dev: device to check
> + *
> + * Returns true if a driver override has been set for this device.
> + */
> +static inline bool device_has_driver_override(struct device *dev)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       return !!dev->driver_override.name;
> +}
> +
> +/**
> + * device_match_driver_override() - Match a driver against the device's =
driver_override.
> + * @dev: device to check
> + * @drv: driver to match against
> + *
> + * Returns > 0 if a driver override is set and matches the given driver,=
 0 if a
> + * driver override is set but does not match, or < 0 if a driver overrid=
e is not
> + * set at all.
> + */
> +static inline int device_match_driver_override(struct device *dev,
> +                                              const struct device_driver=
 *drv)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       if (dev->driver_override.name)
> +               return !strcmp(dev->driver_override.name, drv->name);
> +       return -1;
> +}
> +
>  /**
>   * device_iommu_mapped - Returns true when the device DMA is translated
>   *                      by an IOMMU
> --
> 2.53.0
>
